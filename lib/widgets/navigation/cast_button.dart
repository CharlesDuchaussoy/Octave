import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/services/cast_service.dart';
import 'package:musly/services/upnp_service.dart';
import 'package:musly/theme/app_theme.dart';
import 'airplay_button.dart';

import '../../screens/connect/connect_devices_modal.dart';

class CastButton extends StatelessWidget {
  final Color? iconColor;
  final double iconSize;

  const CastButton({super.key, this.iconColor, this.iconSize = 24});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return AirPlayButton(
        tintColor: iconColor ?? Colors.white,
        size: iconSize,
      );
    }

    final castState = context.select<CastService, CastState>((s) => s.state);
    final upnpConnected = context.select<UpnpService, bool>(
      (s) => s.isConnected,
    );

    final IconData icon;
    final Color color;
    final String tooltip;

    if (castState == CastState.connected) {
      icon = Icons.cast_connected;
      color = Theme.of(context).colorScheme.primary;
      tooltip = 'Cast: Connected';
    } else if (upnpConnected) {
      icon = Icons.speaker_group;
      color = Theme.of(context).colorScheme.primary;
      tooltip =
          'DLNA: ${context.read<UpnpService>().connectedDevice?.friendlyName ?? "device"}';
    } else {
      icon = Icons.cast;
      color = iconColor ?? Colors.white;
      tooltip = 'Connect to a Device';
    }

    return IconButton(
      icon: Icon(icon, size: iconSize),
      color: color,
      tooltip: tooltip,
      onPressed: () {
        final castService = context.read<CastService>();
        final upnpService = context.read<UpnpService>();

        if (castService.isConnected) {
          _showCastControlDialog(context, castService);
        } else if (upnpService.isConnected) {
          _showUpnpControlDialog(context, upnpService);
        } else {
          ConnectDevicesModal.show(context);
        }
      },
    );
  }

  Future<void> _showCastControlDialog(
    BuildContext context,
    CastService castService,
  ) async {

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.octave.surface1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.cast_connected,
                color: Theme.of(context).colorScheme.primary, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Casting',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    castService.deviceName ?? 'Unknown Device',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: context.octave.text2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (castService.mediaState.title != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: (context.octave.text1).withValues(
                    alpha: 0.05,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    if (castService.mediaState.imageUrl != null &&
                        castService.mediaState.imageUrl!.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: castService.mediaState.imageUrl!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          placeholder: (ctx, url) => Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[850],
                          ),
                          errorWidget: (ctx, e, st) => Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.music_note,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            castService.mediaState.title ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            castService.mediaState.artist ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              color: context.octave.text2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            Consumer<CastService>(
              builder: (context, cs, _) => Row(
                children: [
                  Icon(
                    cs.mediaState.volume == 0
                        ? Icons.volume_off
                        : cs.mediaState.volume < 0.5
                            ? Icons.volume_down
                            : Icons.volume_up,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Expanded(
                    child: Slider(
                      value: cs.mediaState.volume.clamp(0.0, 1.0),
                      onChanged: (v) => cs.setVolume(v),
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    '${(cs.mediaState.volume * 100).round()}%',
                    style: TextStyle(
                      fontSize: 14,
                      color: context.octave.text2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
              castService.disconnect();
            },
            icon: Icon(
              Icons.stop_circle_outlined,
              color: context.octave.danger,
            ),
            label: Text(
              AppLocalizations.of(context)!.close,
              style: TextStyle(color: context.octave.danger),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.close),
          ),
        ],
      ),
    );
  }

  Future<void> _showUpnpControlDialog(
    BuildContext context,
    UpnpService upnpService,
  ) async {
    final device = upnpService.connectedDevice;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.octave.surface1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(
              Icons.speaker_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 28,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DLNA',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    device?.friendlyName ?? 'Unknown Device',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: context.octave.text2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (device != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (context.octave.text1).withValues(
                    alpha: 0.05,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow(context, Icons.devices, device.manufacturer),
                    if (device.modelName.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      _infoRow(context, Icons.info_outline, device.modelName),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            Consumer<UpnpService>(
              builder: (context, us, _) {
                if (us.volume < 0) {
                  return Text(
                    'Playback is being sent to this DLNA device. '
                    'Use Octave\'s player controls to manage playback.',
                    style: TextStyle(
                      fontSize: 13,
                      color: context.octave.text2,
                    ),
                    textAlign: TextAlign.center,
                  );
                }
                return Row(
                  children: [
                    Icon(
                      us.volume == 0
                          ? Icons.volume_off
                          : us.volume < 50
                              ? Icons.volume_down
                              : Icons.volume_up,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Expanded(
                      child: Slider(
                        value: (us.volume / 100.0).clamp(0.0, 1.0),
                        onChanged: (v) => us.setVolume((v * 100).round()),
                        activeColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      '${us.volume}%',
                      style: TextStyle(
                        fontSize: 14,
                        color: context.octave.text2,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
              upnpService.disconnect();
            },
            icon: Icon(
              Icons.stop_circle_outlined,
              color: context.octave.danger,
            ),
            label: Text(
              'Disconnect',
              style: TextStyle(color: context.octave.danger),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.close),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color:
              context.octave.text2,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: context.octave.text2,
            ),
          ),
        ),
      ],
    );
  }
}
