import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:musly/models/song.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/widgets/common/album_artwork.dart';
import 'package:musly/utils/navigation_helper.dart';
import 'package:musly/octave/theme/octave_theme.dart';
import 'package:musly/l10n/app_localizations.dart';

class RightSidebar extends StatelessWidget {
  final VoidCallback? onClose;

  const RightSidebar({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: context.octave.surface1,
        border: Border(
          left: BorderSide(color: context.octave.separator, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: context.octave.separator, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.queue,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    size: 20,
                    color: context.octave.text2,
                  ),
                  onPressed: () {
                    onClose?.call();
                    NavigationHelper.isDesktopQueueOpen.value = false;
                  },
                  tooltip: AppLocalizations.of(context)!.closeQueue,
                  splashRadius: 18,
                  hoverColor: Colors.white.withValues(alpha: 0.1),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<PlayerProvider>(
              builder: (context, player, _) {
                final currentSong = player.currentSong;
                final queue = player.queue;
                final currentIndex = player.currentIndex;

                if (queue.isEmpty && currentSong == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.music_note_rounded,
                          size: 32,
                          color: context.octave.text3,
                        ),
                        SizedBox(height: 12),
                        Text(
                          AppLocalizations.of(context)!.queueEmpty,
                          style: TextStyle(
                            color: context.octave.text3,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final upcomingCount =
                    (queue.length - currentIndex - 1).clamp(0, queue.length);

                return ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  children: [
                    if (currentSong != null) ...[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
                        child: Text(
                          AppLocalizations.of(context)!.nowPlaying.toUpperCase(),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: context.octave.text3,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: context.octave.accent.withValues(alpha: 0.1),
                          border: Border.all(
                            color:
                                context.octave.accent.withValues(alpha: 0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            AlbumArtwork(
                              coverArt: currentSong.coverArt,
                              size: 40,
                              borderRadius: 6,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.title,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: context.octave.accent,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    currentSong.artist ?? 'Unknown Artist',
                                    style: TextStyle(
                                      fontSize: 11,
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
                    ],
                    if (upcomingCount > 0) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text(
                          AppLocalizations.of(context)!.nextUpCount(upcomingCount).toUpperCase(),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: context.octave.text3,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      for (int i = currentIndex + 1; i < queue.length; i++)
                        _UpcomingSongTile(
                          song: queue[i],
                          index: i,
                          onPlay: () => player.skipToIndex(i),
                          onRemove: () => player.removeFromQueue(i),
                        ),
                    ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _UpcomingSongTile extends StatefulWidget {
  final Song song;
  final int index;
  final VoidCallback onPlay;
  final VoidCallback onRemove;

  const _UpcomingSongTile({
    required this.song,
    required this.index,
    required this.onPlay,
    required this.onRemove,
  });

  @override
  State<_UpcomingSongTile> createState() => _UpcomingSongTileState();
}

class _UpcomingSongTileState extends State<_UpcomingSongTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            AlbumArtwork(
              coverArt: widget.song.coverArt,
              size: 36,
              borderRadius: 6,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.song.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.song.artist ?? 'Unknown Artist',
                    style: TextStyle(
                      fontSize: 11,
                      color: context.octave.text2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (_isHovered) ...[
              IconButton(
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 16,
                  color: context.octave.text2,
                ),
                onPressed: widget.onPlay,
                tooltip: AppLocalizations.of(context)!.play,
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(4),
                hoverColor: Colors.white.withValues(alpha: 0.1),
              ),
              const SizedBox(width: 4),
              IconButton(
                icon: Icon(
                  Icons.delete_outline_rounded,
                  size: 16,
                  color: context.octave.text2,
                ),
                onPressed: widget.onRemove,
                tooltip: AppLocalizations.of(context)!.remove,
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(4),
                hoverColor: context.octave.danger.withValues(alpha: 0.2),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
