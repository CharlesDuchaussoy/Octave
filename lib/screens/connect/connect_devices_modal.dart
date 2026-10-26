import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chrome_cast/flutter_chrome_cast.dart';
import 'package:provider/provider.dart';

import '../../providers/player_provider.dart';

import '../../services/cast_service.dart';
import '../../services/upnp_service.dart';
import 'package:musly/octave/theme/octave_theme.dart';
import 'package:musly/l10n/app_localizations.dart';

class ConnectDevicesModal extends StatefulWidget {
  final bool isDesktopDialog;

  const ConnectDevicesModal({
    super.key,
    this.isDesktopDialog = false,
  });

  static Future<void> show(BuildContext context) {
    HapticFeedback.mediumImpact();
    final isDesktop =
        !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

    if (isDesktop) {
      return showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440, maxHeight: 600),
            child: const ConnectDevicesModal(isDesktopDialog: true),
          ),
        ),
      );
    }

    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const ConnectDevicesModal(isDesktopDialog: false),
    );
  }

  @override
  State<ConnectDevicesModal> createState() => _ConnectDevicesModalState();
}

class _ConnectDevicesModalState extends State<ConnectDevicesModal> {
  final GoogleCastDiscoveryManagerPlatformInterface _discoveryManager =
      GoogleCastDiscoveryManager.instance;

  bool get _isCastSupported =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final upnp = Provider.of<UpnpService>(context, listen: false);
      upnp.discover();

      if (_isCastSupported) {
        try {
          _discoveryManager.startDiscovery();
        } catch (_) {}
      }
    });
  }

  @override
  void dispose() {
    if (_isCastSupported) {
      try {
        _discoveryManager.stopDiscovery();
      } catch (_) {}
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final surfaceColor = context.octave.surface1;
    final dividerColor = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.black.withValues(alpha: 0.06);

    return Consumer2<CastService, UpnpService>(
      builder: (context, castService, upnpService, _) {
        final player = Provider.of<PlayerProvider>(context, listen: false);

        return Container(
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: widget.isDesktopDialog
                ? BorderRadius.circular(16)
                : const BorderRadius.vertical(top: Radius.circular(20)),
            border: widget.isDesktopDialog
                ? Border.all(color: dividerColor, width: 1)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 28,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          constraints: BoxConstraints(
            maxHeight: widget.isDesktopDialog
                ? 600
                : MediaQuery.of(context).size.height * 0.82,
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.isDesktopDialog) ...[
                  Center(
                    child: Container(
                      width: 32,
                      height: 4,
                      decoration: BoxDecoration(
                        color: context.octave.separator,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.connectToDevice,
                          style: TextStyle(
                            fontSize: widget.isDesktopDialog ? 17 : 19,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          AppLocalizations.of(context)!.connectChooseOutput,
                          style: TextStyle(
                            fontSize: 12,
                            color: context.octave.text3,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.xmark_circle_fill,
                          size: 22),
                      color: context.octave.text3,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCurrentDeviceTile(player, isDark),
                        const SizedBox(height: 16),
                        StreamBuilder<List<GoogleCastDevice>>(
                          stream: _discoveryManager.devicesStream,
                          builder: (context, snapshot) {
                            final castDevices = snapshot.data ?? [];
                            final upnpDevices = upnpService.devices;
                            final hasWireless = castDevices.isNotEmpty ||
                                upnpDevices.isNotEmpty;

                            if (!hasWireless) return const SizedBox.shrink();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildSectionLabel(AppLocalizations.of(context)!.connectSpeakersTvs.toUpperCase()),
                                const SizedBox(height: 6),
                                ...castDevices.map((cd) => _buildCastRow(
                                    context, cd, castService, isDark)),
                                ...upnpDevices.map((ud) => _buildUpnpRow(
                                    context, ud, upnpService, isDark)),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.grey,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildCurrentDeviceTile(PlayerProvider player, bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    final deviceName = Platform.isWindows
        ? l10n.deviceWindowsPc
        : (Platform.isMacOS
            ? l10n.deviceMac
            : (Platform.isLinux
                ? l10n.deviceLinuxPc
                : (Platform.isIOS ? l10n.deviceIphone : l10n.deviceThis)));
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: isDark ? 0.12 : 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.volume_up_rounded, color: primaryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deviceName,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  AppLocalizations.of(context)!.playingOnThisDevice,
                  style: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Icon(CupertinoIcons.waveform, color: primaryColor, size: 18),
        ],
      ),
    );
  }

  Widget _buildCastRow(BuildContext context, GoogleCastDevice castDevice,
      CastService cast, bool isDark) {
    final tileBg = context.octave.surface2;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: tileBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          leading: const Icon(Icons.cast, size: 20, color: Colors.grey),
          title: Text(castDevice.friendlyName,
              style:
                  const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
          subtitle: Text(castDevice.modelName ?? 'Google Cast',
              style: const TextStyle(fontSize: 11.5, color: Colors.grey)),
          onTap: () async {
            final ok = await cast.connectToDevice(castDevice);
            if (context.mounted) {
              Navigator.of(context).pop();
              if (!ok) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          AppLocalizations.of(context)!.connectFailed(castDevice.friendlyName))),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildUpnpRow(BuildContext context, UpnpDevice upnpDevice,
      UpnpService upnp, bool isDark) {
    final tileBg = context.octave.surface2;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: tileBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          leading:
              const Icon(Icons.speaker_group, size: 20, color: Colors.grey),
          title: Text(upnpDevice.friendlyName,
              style:
                  const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
          subtitle: Text(
            [upnpDevice.manufacturer, upnpDevice.modelName]
                .where((s) => s.isNotEmpty)
                .join(' • '),
            style: const TextStyle(fontSize: 11.5, color: Colors.grey),
          ),
          onTap: () async {
            final ok = await upnp.connect(upnpDevice);
            if (context.mounted) {
              Navigator.of(context).pop();
              if (!ok) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          AppLocalizations.of(context)!.connectFailed(upnpDevice.friendlyName))),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
