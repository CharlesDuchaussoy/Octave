import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/song.dart';
import '../../providers/player_provider.dart';
import '../../utils/formatters.dart';
import 'album_artwork.dart';
import 'animated_equalizer.dart';
import '../modals/song_options_modal.dart';

import 'swipeable_song_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:musly/octave/theme/octave_theme.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/octave/widgets/outside_library_badge.dart';

class SongTile extends StatelessWidget {
  final Song song;
  final List<Song>? playlist;
  final int? index;
  final bool showArtwork;
  final bool showArtist;
  final bool showAlbum;
  final bool showDuration;
  final bool showTrackNumber;
  final bool enableSwipeToQueue;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? trailing;

  /// Inner padding of the row; lists already inside the page margin pass
  /// a horizontal padding of zero so covers line up with the headings.
  final EdgeInsetsGeometry contentPadding;

  const SongTile({
    super.key,
    required this.song,
    this.playlist,
    this.index,
    this.showArtwork = true,
    this.showArtist = true,
    this.showAlbum = false,
    this.showDuration = false,
    this.showTrackNumber = false,
    this.enableSwipeToQueue = true,
    this.onTap,
    this.onLongPress,
    this.trailing,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        final isCurrentSong = playerProvider.currentSong?.id == song.id;
        final isPlaying = isCurrentSong && playerProvider.isPlaying;

        final actualOnTap = onTap ?? () => _playSong(context);
        final actualOnLongPress = onLongPress ?? () => _showOptions(context);

        final tile = ListTile(
          dense: true,
          contentPadding: contentPadding,
          leading: _buildLeading(
            context,
            isCurrentSong: isCurrentSong,
            isPlaying: isPlaying,
          ),
          title: Text(
            song.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: isCurrentSong ? FontWeight.bold : FontWeight.w500,
              color: isCurrentSong
                  ? theme.colorScheme.primary
                  : (context.octave.text1),
            ),
          ),
          subtitle: _buildSubtitle(context),
          trailing: trailing ?? _buildTrailing(context),
          onTap: actualOnTap,
          onLongPress: actualOnLongPress,
        );

        Widget finalTile = tile;
        if (enableSwipeToQueue) {
          finalTile = SwipeableSongTile(
            onSwipeToQueue: () {
              playerProvider.addToQueue(song);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(CupertinoIcons.text_badge_plus,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.songAddedToQueue(song.title),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              );
            },
            child: tile,
          );
        }

        return finalTile;
      },
    );
  }

  Widget? _buildLeading(
    BuildContext context, {
    required bool isCurrentSong,
    required bool isPlaying,
  }) {
    if (showArtwork) {
      final artwork = AlbumArtwork(
        coverArt: song.coverArt,
        size: 44,
        borderRadius: 6,
      );

      if (isCurrentSong) {
        return SizedBox(
          width: 44,
          height: 44,
          child: Stack(
            alignment: Alignment.center,
            children: [
              artwork,
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              Center(
                child: AnimatedEqualizer(
                  color: Colors.white,
                  isPlaying: isPlaying,
                ),
              ),
            ],
          ),
        );
      }

      return artwork;
    }

    if (showTrackNumber && song.track != null) {
      if (isCurrentSong) {
        return SizedBox(
          width: 32,
          height: 44,
          child: Center(
            child: AnimatedEqualizer(
              color: Theme.of(context).colorScheme.primary,
              isPlaying: isPlaying,
            ),
          ),
        );
      }

      return SizedBox(
        width: 32,
        height: 44,
        child: Center(
          child: Text(
            '${song.track}',
            style: TextStyle(color: context.octave.text2, fontSize: 14),
          ),
        ),
      );
    }

    if (isCurrentSong) {
      return SizedBox(
        width: 44,
        height: 44,
        child: Center(
          child: AnimatedEqualizer(
            color: Theme.of(context).colorScheme.primary,
            isPlaying: isPlaying,
          ),
        ),
      );
    }

    return null;
  }

  Widget? _buildSubtitle(BuildContext context) {
    final parts = <String>[];
    if (showArtist && song.artist != null && song.artist!.isNotEmpty) {
      parts.add(song.artist!);
    }
    if (showAlbum && song.album != null && song.album!.isNotEmpty) {
      parts.add(song.album!);
    }

    if (parts.isEmpty) return null;

    return withOutsideBadge(
      outside: song.isExternal,
      badgeColor: context.octave.text3,
      text: Text(
        parts.join(' • '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12, color: context.octave.text2),
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    if (showDuration && song.duration != null && song.duration! > 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            FormatUtils.formatSeconds(song.duration),
            style: TextStyle(fontSize: 12, color: context.octave.text2),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 20,
            color: Theme.of(context).textTheme.bodySmall?.color,
            onPressed: () => _showOptions(context),
          ),
        ],
      );
    }

    return IconButton(
      icon: const Icon(Icons.more_horiz),
      iconSize: 20,
      color: Theme.of(context).textTheme.bodySmall?.color,
      onPressed: () => _showOptions(context),
    );
  }

  void _playSong(BuildContext context) {
    HapticFeedback.selectionClick();
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    playerProvider.playSong(song, playlist: playlist, startIndex: index);
  }

  void _showOptions(BuildContext context) {
    SongOptionsModal.show(context, song);
  }
}
