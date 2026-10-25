import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/widgets/settings/settings_section_card.dart';
import 'package:musly/widgets/settings/settings_list_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:musly/octave/setup/setup_flow.dart';
import 'package:musly/screens/wrapped/wrapped_screen.dart';
import 'package:musly/services/wrapped_service.dart';
import 'package:musly/services/update_service.dart';
import 'package:musly/widgets/dialogs/update_dialog.dart';

class SettingsAboutTab extends StatefulWidget {
  const SettingsAboutTab({super.key});

  @override
  State<SettingsAboutTab> createState() => _SettingsAboutTabState();
}

class _SettingsAboutTabState extends State<SettingsAboutTab> {
  int _versionTapCount = 0;
  bool _devWrappedUnlocked = false;
  bool _isCheckingUpdates = false;

  bool get _isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionAboutInformation,
          children: [
            _buildInfoTile(
              context,
              icon: CupertinoIcons.info,
              title: AppLocalizations.of(context)!.aboutVersion,
              subtitle: UpdateService.currentVersion,
              onTap: _onVersionTapped,
            ),
            _buildDivider(context),
            _buildInfoTile(
              context,
              icon: CupertinoIcons.device_phone_portrait,
              title: AppLocalizations.of(context)!.aboutPlatform,
              subtitle: Theme.of(context).platform.name.toUpperCase(),
            ),
            _buildDivider(context),
            _buildActionTile(
              context,
              icon: CupertinoIcons.arrow_2_circlepath,
              title: AppLocalizations.of(context)!.checkForUpdates,
              subtitle: _isCheckingUpdates
                  ? AppLocalizations.of(context)!.checkingForUpdates
                  : null,
              trailing: _isCheckingUpdates
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : null,
              onTap: _isCheckingUpdates ? null : _checkForUpdatesManual,
            ),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionAboutDeveloper,
          children: [_buildDeveloperInfo(context)],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionAboutLinks,
          children: [
            _buildLinkTile(
              context,
              icon: Icons.code_rounded,
              title: AppLocalizations.of(context)!.aboutLinkGitHub,
              url: 'https://github.com/CharlesDuchaussoy/Octave',
            ),
            _buildDivider(context),
            _buildLinkTile(
              context,
              icon: CupertinoIcons.doc_text,
              title: AppLocalizations.of(context)!.aboutLinkChangelog,
              url:
                  'https://github.com/CharlesDuchaussoy/Octave/releases/tag/v${UpdateService.currentVersion}',
            ),
            _buildDivider(context),
            _buildLinkTile(
              context,
              icon: CupertinoIcons.exclamationmark_bubble,
              title: AppLocalizations.of(context)!.aboutLinkReportIssue,
              url: 'https://github.com/CharlesDuchaussoy/Octave/issues/new',
            ),
            _buildDivider(context),
            _buildActionTile(
              context,
              icon: CupertinoIcons.slider_horizontal_3,
              title: AppLocalizations.of(context)!.setupRedoTitle,
              subtitle: AppLocalizations.of(context)!.setupRedoSubtitle,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (routeContext) => SetupFlow(
                      onFinished: () => Navigator.of(routeContext).pop(),
                    ),
                  ),
                );
              },
            ),
            if (!_isDesktop &&
                (WrappedService.isWrappedSeason() ||
                    (kDebugMode && _devWrappedUnlocked))) ...[
              _buildDivider(context),
              _buildActionTile(
                context,
                icon: CupertinoIcons.gift_fill,
                title: kDebugMode && !WrappedService.isWrappedSeason()
                    ? AppLocalizations.of(context)!.muslyPlaybackDev
                    : AppLocalizations.of(context)!.muslyPlaybackAnnual,
                subtitle: kDebugMode && !WrappedService.isWrappedSeason()
                    ? AppLocalizations.of(context)!.muslyPlaybackDevSubtitle
                    : AppLocalizations.of(context)!.muslyPlaybackAnnualSubtitle,
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => WrappedScreen(
                        devPreview: kDebugMode && _devWrappedUnlocked,
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 56),
      child: Container(
        height: 0.5,
        color: context.octave.separator,
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return SettingsListTile(
      icon: icon,
      title: title,
      trailing: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          color: context.octave.text2,
        ),
      ),
      onTap: onTap,
    );
  }

  void _onVersionTapped() {
    if (!kDebugMode || _isDesktop) return;

    setState(() {
      _versionTapCount++;
      if (_versionTapCount >= 8) {
        _devWrappedUnlocked = true;
      }
    });

    HapticFeedback.lightImpact();

    if (_versionTapCount < 8 && _versionTapCount >= 4) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.devPlaybackTapsAway(8 - _versionTapCount)),
          duration: const Duration(milliseconds: 700),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (_versionTapCount == 8) {
      final l10n = AppLocalizations.of(context)!;
      HapticFeedback.heavyImpact();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(CupertinoIcons.sparkles,
                  color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(l10n.devPlaybackUnlocked),
            ],
          ),
          backgroundColor: context.octave.accent,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget _buildDeveloperInfo(BuildContext context) {
    return SettingsListTile(
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [context.octave.accent, context.octave.accent],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.code_rounded, color: Colors.white, size: 18),
      ),
      title: AppLocalizations.of(context)!.aboutMadeBy,
      subtitle: AppLocalizations.of(context)!.aboutGitHub,
      trailing: const Icon(Icons.open_in_new_rounded, size: 18),
      onTap: () => _openUrl('https://github.com/dddevid'),
    );
  }

  Widget _buildLinkTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required String url,
  }) {
    return SettingsListTile(
      icon: icon,
      title: title,
      subtitle: subtitle,
      trailing: Icon(
        Icons.open_in_new_rounded,
        size: 18,
        color: context.octave.text2,
      ),
      onTap: () => _openUrl(url),
    );
  }

  void _openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error opening URL: $e');
    }
  }

  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return SettingsListTile(
      icon: icon,
      title: title,
      subtitle: subtitle,
      trailing: trailing ??
          (onTap != null
              ? Icon(
                  CupertinoIcons.chevron_forward,
                  size: 18,
                  color: context.octave.text2,
                )
              : null),
      onTap: onTap,
    );
  }

  Future<void> _checkForUpdatesManual() async {
    if (_isCheckingUpdates) return;
    setState(() => _isCheckingUpdates = true);

    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.checkingForUpdates),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );

    try {
      final release = await UpdateService.checkForUpdate(force: true);
      if (!mounted) return;

      if (release != null) {
        await UpdateDialog.show(context, release);
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.appUpToDate),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorWithDetails('$e')),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isCheckingUpdates = false);
      }
    }
  }
}
