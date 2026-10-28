import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:musly/providers/auth_provider.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/providers/library_provider.dart';
import 'package:musly/services/local_music_service.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/l10n/app_localizations.dart';

class AddServerScreen extends StatefulWidget {
  final String? initialFamily;

  const AddServerScreen({super.key, this.initialFamily});

  @override
  State<AddServerScreen> createState() => _AddServerScreenState();
}

class _AddServerScreenState extends State<AddServerScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _selectedFamily;

  final _nameController = TextEditingController();
  final _urlController = TextEditingController();
  final _lanUrlController = TextEditingController();
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  bool _obscurePassword = true;
  bool _allowSelfSigned = false;
  bool _useLegacyAuth = false;
  bool _showAdvanced = false;
  String? _customCertPath;
  String? _customCertName;
  String? _clientCertPath;
  String? _clientCertName;
  final _clientCertPassController = TextEditingController();
  bool _obscureClientCertPass = true;

  bool _isConnecting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Octave adds Navidrome servers, or phone files while they last.
    _selectedFamily =
        widget.initialFamily == 'local' ? 'local' : 'subsonic';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    _lanUrlController.dispose();
    _userController.dispose();
    _passController.dispose();
    _clientCertPassController.dispose();
    super.dispose();
  }

  Future<void> _pickCustomCertificate() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['crt', 'cer', 'pem', 'der'],
      );
      if (result != null && result.files.single.path != null) {
        setState(() {
          _customCertPath = result.files.single.path;
          _customCertName = result.files.single.name;
        });
      }
    } catch (e) {
      debugPrint('Error picking certificate: $e');
    }
  }

  Future<void> _pickClientCertificate() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['p12', 'pfx'],
      );
      if (result != null && result.files.single.path != null) {
        setState(() {
          _clientCertPath = result.files.single.path;
          _clientCertName = result.files.single.name;
        });
      }
    } catch (e) {
      debugPrint('Error picking client certificate: $e');
    }
  }

  bool _isRemoteInsecureHttp(String url) {
    final trimmed = url.trim().toLowerCase();
    if (!trimmed.startsWith('http://')) return false;
    final uri = Uri.tryParse(trimmed);
    if (uri == null || uri.host.isEmpty) return false;
    final host = uri.host.toLowerCase();
    if (host == 'localhost' ||
        host == '127.0.0.1' ||
        host == '::1' ||
        host.endsWith('.local') ||
        host.startsWith('192.168.') ||
        host.startsWith('10.') ||
        RegExp(r'^172\.(1[6-9]|2[0-9]|3[0-1])\.').hasMatch(host)) {
      return false;
    }
    return true;
  }

  Future<void> _connectServer() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final libraryProvider =
        Provider.of<LibraryProvider>(context, listen: false);

    var rawUrl = _urlController.text.trim();
    if (!rawUrl.startsWith('http://') && !rawUrl.startsWith('https://')) {
      rawUrl = 'https://$rawUrl';
    }

    final user = _userController.text.trim();
    final pass = _passController.text;
    final profileName = _nameController.text.trim();

    setState(() {
      _isConnecting = true;
      _errorMessage = null;
    });

    try {
      await playerProvider.stop();
      final success = await authProvider.login(
        serverUrl: rawUrl,
        username: user,
        password: pass,
        serverFamily: _selectedFamily,
        profileName: profileName.isNotEmpty ? profileName : null,
        lanUrl: _lanUrlController.text.trim().isNotEmpty
            ? _lanUrlController.text.trim()
            : null,
        allowSelfSignedCertificates: _allowSelfSigned,
        useLegacyAuth: _useLegacyAuth,
        customCertificatePath: _customCertPath,
        clientCertificatePath: _clientCertPath,
        clientCertificatePassword: _clientCertPassController.text.isNotEmpty
            ? _clientCertPassController.text
            : null,
      );

      if (success) {
        await libraryProvider.refresh();
        if (!mounted) return;
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(CupertinoIcons.checkmark_circle_fill,
                    color: context.octave.success, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.connectedTo(
                        profileName.isNotEmpty ? profileName : user),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      } else {
        setState(() {
          _isConnecting = false;
          _errorMessage =
              authProvider.error ?? AppLocalizations.of(context)!.loginHintCredentials;
        });
      }
    } catch (e) {
      setState(() {
        _isConnecting = false;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          context.octave.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor:
            context.octave.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: context.octave.text1,
            size: 26,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppLocalizations.of(context)!.addServerButton,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: context.octave.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_errorMessage != null) ...[
              _buildErrorBanner(isDark),
              const SizedBox(height: 16),
            ],
            if (_selectedFamily == 'local')
              _buildLocalFilesCard(isDark)
            else
              _buildServerForm(isDark),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorBanner(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.octave.danger.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.octave.danger.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error_outline, color: context.octave.danger, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.failedToConnect,
                  style: TextStyle(
                      color: context.octave.danger,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                const SizedBox(height: 2),
                Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: context.octave.danger,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocalFilesCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: context.octave.surface1,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [context.octave.success, Color(0xFF30B0C7)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(CupertinoIcons.folder_fill,
                    color: Colors.white, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.localMusicLibrary,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalizations.of(context)!.localFilesDescription,
                      style: TextStyle(
                        fontSize: 12,
                        color: context.octave.text2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _isConnecting ? null : _connectLocalFiles,
              icon: const Icon(CupertinoIcons.folder_open, size: 18),
              label: Text(
                AppLocalizations.of(context)!.useLocalFiles,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.octave.success,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _connectLocalFiles() async {
    final localService = Provider.of<LocalMusicService>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);

    final granted = await localService.requestPermission();
    if (!granted) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.storagePermissionRequired)),
        );
      }
      return;
    }

    setState(() => _isConnecting = true);
    try {
      await playerProvider.stop();
      if (Platform.isIOS) {
        await localService.pickAndAddFiles();
      } else {
        await localService.scanForMusic();
      }
      if (localService.songs.isNotEmpty) {
        await authProvider.setLocalOnlyMode(true);
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    } finally {
      if (mounted) setState(() => _isConnecting = false);
    }
  }

  Widget _buildServerForm(bool isDark) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.octave.surface1,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color:
                isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.06),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.profileNameOptional,
                hintText: AppLocalizations.of(context)!.profileNameHint,
                prefixIcon: const Icon(CupertinoIcons.tag),
                filled: true,
                fillColor:
                    context.octave.surface2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _urlController,
              keyboardType: TextInputType.url,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return AppLocalizations.of(context)!.serverUrlRequired;
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.serverUrlRequired,
                hintText: AppLocalizations.of(context)!.serverUrlHint,
                prefixIcon: const Icon(CupertinoIcons.link),
                filled: true,
                fillColor:
                    context.octave.surface2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            if (_isRemoteInsecureHttp(_urlController.text)) ...[
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: context.octave.warning.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: context.octave.warning.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.exclamationmark_shield_fill,
                        size: 16, color: context.octave.warning),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.loginInsecureHttp,
                        style: TextStyle(
                          fontSize: 12,
                          color: context.octave.warning,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 14),
            TextFormField(
              controller: _lanUrlController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.lanServerUrlOptional,
                hintText: 'e.g. http://192.168.1.5:4533',
                prefixIcon: const Icon(CupertinoIcons.wifi),
                filled: true,
                fillColor:
                    context.octave.surface2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _userController,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return AppLocalizations.of(context)!.usernameRequired;
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.usernameRequired,
                prefixIcon: const Icon(CupertinoIcons.person),
                filled: true,
                fillColor:
                    context.octave.surface2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _passController,
              obscureText: _obscurePassword,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return AppLocalizations.of(context)!.passwordRequired;
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.passwordRequired,
                prefixIcon: const Icon(CupertinoIcons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                    size: 20,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
                filled: true,
                fillColor:
                    context.octave.surface2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => setState(() => _showAdvanced = !_showAdvanced),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(
                      _showAdvanced
                          ? CupertinoIcons.chevron_down
                          : CupertinoIcons.chevron_right,
                      size: 16,
                      color: primaryColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      AppLocalizations.of(context)!.advancedOptions,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_showAdvanced) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.octave.surface2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.allowSelfSignedCerts,
                          style: const TextStyle(fontSize: 13)),
                      subtitle: Text(l10n.allowSelfSignedCertificatesSubtitle,
                          style: const TextStyle(fontSize: 11)),
                      value: _allowSelfSigned,
                      onChanged: (v) => setState(() => _allowSelfSigned = v),
                    ),
                    const Divider(height: 12),
                    SwitchListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.legacyAuthentication,
                          style: const TextStyle(fontSize: 13)),
                      subtitle: Text(l10n.legacyAuthenticationSubtitle,
                          style: const TextStyle(fontSize: 11)),
                      value: _useLegacyAuth,
                      onChanged: (v) => setState(() => _useLegacyAuth = v),
                    ),
                    const Divider(height: 12),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        _customCertName ?? l10n.customTlsCertificate,
                        style: const TextStyle(fontSize: 13),
                      ),
                      subtitle: Text(l10n.certificateFileSubtitle,
                          style: const TextStyle(fontSize: 11)),
                      trailing: IconButton(
                        icon: const Icon(CupertinoIcons.folder, size: 18),
                        onPressed: _pickCustomCertificate,
                      ),
                    ),
                    const Divider(height: 12),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        _clientCertName ?? l10n.clientCertificate,
                        style: const TextStyle(fontSize: 13),
                      ),
                      subtitle: Text(l10n.clientIdentityFileSubtitle,
                          style: const TextStyle(fontSize: 11)),
                      trailing: IconButton(
                        icon: const Icon(CupertinoIcons.folder, size: 18),
                        onPressed: _pickClientCertificate,
                      ),
                    ),
                    if (_clientCertPath != null) ...[
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _clientCertPassController,
                        obscureText: _obscureClientCertPass,
                        decoration: InputDecoration(
                          labelText: l10n.clientCertPassword,
                          prefixIcon: const Icon(CupertinoIcons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureClientCertPass
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              size: 18,
                            ),
                            onPressed: () => setState(() =>
                                _obscureClientCertPass =
                                    !_obscureClientCertPass),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: _isConnecting ? null : _connectServer,
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: _isConnecting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2.5),
                      )
                    : Text(
                        AppLocalizations.of(context)!.addServerButton,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
