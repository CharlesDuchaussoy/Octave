import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/player_provider.dart';
import '../../widgets/common/album_artwork.dart';
import '../server/queue_handoff.dart';
import '../theme/octave_theme.dart';

/// "Pick up where you left off": the queue another device or app saved
/// on the server, with the song it was on, offered at the top of home.
class ResumeQueueBanner extends StatelessWidget {
  const ResumeQueueBanner({super.key, required this.horizontalPadding});

  final double horizontalPadding;

  /// "à l'instant", "il y a 5 min", "il y a 2 h", "hier"...
  static String ago(AppLocalizations l10n, DateTime when, DateTime now) {
    final elapsed = now.difference(when);
    if (elapsed.inMinutes < 1) return l10n.agoNow;
    if (elapsed.inHours < 1) return l10n.agoMinutes(elapsed.inMinutes);
    if (elapsed.inDays < 1) return l10n.agoHours(elapsed.inHours);
    return l10n.agoDays(elapsed.inDays);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ServerQueue?>(
      valueListenable: QueueHandoff.instance.offer,
      builder: (context, queue, _) {
        if (queue == null) return const SizedBox.shrink();
        final l10n = AppLocalizations.of(context)!;
        final colors = context.octave;
        final song = queue.current;
        final when = ago(l10n, queue.changed.toLocal(), DateTime.now());
        // Another Octave says "another device"; another app says its name.
        final app = queue.changedBy;
        final detail = app.isEmpty || app == 'Octave'
            ? l10n.queueHandoffOnDevice(song.title, when)
            : l10n.queueHandoffInApp(song.title, app, when);

        return Padding(
          padding:
              EdgeInsets.fromLTRB(horizontalPadding, 4, horizontalPadding, 20),
          child: Material(
            color: colors.surface1,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 4, 12),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AlbumArtwork(
                        coverArt: song.coverArt,
                        size: 52,
                        borderRadius: 8,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.queueHandoffTitle,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: colors.text1,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              detail,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 13, color: colors.text2),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.queueHandoffDismiss,
                        visualDensity: VisualDensity.compact,
                        icon: Icon(CupertinoIcons.xmark,
                            size: 18, color: colors.text3),
                        onPressed: QueueHandoff.instance.dismiss,
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: FilledButton.tonal(
                        onPressed: () => _resume(context, queue),
                        child: Text(l10n.queueHandoffResume),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _resume(BuildContext context, ServerQueue queue) async {
    final player = Provider.of<PlayerProvider>(context, listen: false);
    QueueHandoff.instance.taken();
    await player.playSong(
      queue.current,
      playlist: queue.songs,
      startIndex: queue.currentIndex,
      initialPosition: queue.position,
    );
  }
}
