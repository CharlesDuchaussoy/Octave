import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../models/artist.dart';
import '../../widgets/common/album_artwork.dart';
import '../server/taste_artists.dart';
import '../theme/octave_theme.dart';
import 'setup_widgets.dart';

/// The artists step of the guided setup: the person's most played artists
/// and the charts of the moment, with a search over the whole catalog
/// (outside the library too) to add others. Loading and searching are
/// passed in, so the step does not depend on a server.
class TasteArtistsStep extends StatefulWidget {
  const TasteArtistsStep({
    super.key,
    required this.suggestions,
    required this.search,
    required this.selected,
    required this.onToggle,
  });

  /// Null while loading.
  final TasteArtists? suggestions;
  final Future<List<Artist>> Function(String query) search;

  /// Picked artists, by id, in the order they were picked.
  final Map<String, Artist> selected;
  final ValueChanged<Artist> onToggle;

  /// The server searches outside the library only from 3 characters on.
  static const minQueryLength = 3;

  /// Artists shown per section, before searching.
  static const perSection = 12;

  @override
  State<TasteArtistsStep> createState() => _TasteArtistsStepState();
}

class _TasteArtistsStepState extends State<TasteArtistsStep> {
  final _query = TextEditingController();
  Timer? _debounce;
  List<Artist>? _results;
  String _searched = '';

  @override
  void dispose() {
    _debounce?.cancel();
    _query.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    _debounce?.cancel();
    final query = value.trim();
    setState(() {
      if (query.length < TasteArtistsStep.minQueryLength) {
        _results = null;
        _searched = '';
      }
    });
    if (query.length < TasteArtistsStep.minQueryLength) return;
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      setState(() {
        _searched = query;
        _results = null;
      });
      List<Artist> found;
      try {
        found = await widget.search(query);
      } catch (_) {
        found = const [];
      }
      // A newer search may have started meanwhile.
      if (!mounted || _query.text.trim() != query) return;
      setState(() => _results = found);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.octave;
    final searching = _query.text.trim().length >= TasteArtistsStep.minQueryLength;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _query,
          onChanged: _onQueryChanged,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: l10n.setupArtistsSearchHint,
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: _query.text.isEmpty
                ? null
                : IconButton(
                    tooltip: l10n.clear,
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () {
                      _query.clear();
                      _onQueryChanged('');
                    },
                  ),
            filled: true,
            fillColor: colors.surface1,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        if (widget.selected.isNotEmpty) ...[
          const SizedBox(height: 16),
          SetupSectionLabel(l10n.setupArtistsPicked(widget.selected.length)),
          _PickedRow(
            artists: widget.selected.values.toList(),
            onRemove: widget.onToggle,
          ),
        ],
        const SizedBox(height: 16),
        if (searching) ..._buildResults(l10n) else ..._buildSuggestions(l10n),
      ],
    );
  }

  List<Widget> _buildResults(AppLocalizations l10n) {
    final results = _results;
    if (results == null || _searched.isEmpty) return [_loading()];
    if (results.isEmpty) return [_note(l10n.setupArtistsNoResult)];
    return [_grid(results)];
  }

  List<Widget> _buildSuggestions(AppLocalizations l10n) {
    final suggestions = widget.suggestions;
    if (suggestions == null) return [_loading()];

    // An artist shows once, in the first section that has it.
    final seen = <String>{};
    List<Artist> fresh(List<Artist> artists) => [
          for (final a in artists)
            if (seen.add(a.id)) a,
        ].take(TasteArtistsStep.perSection).toList();

    final sections = [
      (l10n.setupArtistsMine, fresh(suggestions.mine)),
      (l10n.setupArtistsFrance, fresh(suggestions.france)),
      (l10n.setupArtistsWorld, fresh(suggestions.world)),
    ].where((s) => s.$2.isNotEmpty).toList();

    if (sections.isEmpty) return [_note(l10n.setupArtistsEmpty)];
    return [
      for (final (title, artists) in sections) ...[
        SetupSectionLabel(title),
        _grid(artists),
        const SizedBox(height: 20),
      ],
    ];
  }

  Widget _grid(List<Artist> artists) {
    return LayoutBuilder(builder: (context, constraints) {
      const spacing = 12.0;
      final columns = (constraints.maxWidth / 110).floor().clamp(3, 5);
      final width = (constraints.maxWidth - spacing * (columns - 1)) / columns;
      return Wrap(
        spacing: spacing,
        runSpacing: 18,
        children: [
          for (final artist in artists)
            SizedBox(
              width: width,
              child: SetupArtistChoice(
                artist: artist,
                size: width,
                selected: widget.selected.containsKey(artist.id),
                onTap: () => widget.onToggle(artist),
              ),
            ),
        ],
      );
    });
  }

  Widget _loading() => const Padding(
        padding: EdgeInsets.only(top: 40),
        child: Center(child: CircularProgressIndicator()),
      );

  Widget _note(String text) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(text,
            style: TextStyle(fontSize: 15, color: context.octave.text2)),
      );
}

/// The picked artists, in a row; a tap removes one.
class _PickedRow extends StatelessWidget {
  const _PickedRow({required this.artists, required this.onRemove});

  final List<Artist> artists;
  final ValueChanged<Artist> onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: artists.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => SizedBox(
          width: 68,
          child: SetupArtistChoice(
            artist: artists[index],
            size: 68,
            selected: true,
            compact: true,
            onTap: () => onRemove(artists[index]),
          ),
        ),
      ),
    );
  }
}

/// One artist to pick: round photo, name, a check when picked.
class SetupArtistChoice extends StatelessWidget {
  const SetupArtistChoice({
    super.key,
    required this.artist,
    required this.size,
    required this.selected,
    required this.onTap,
    this.compact = false,
  });

  final Artist artist;
  final double size;
  final bool selected;
  final VoidCallback onTap;

  /// Smaller name, on one line (the row of picked artists).
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    return Semantics(
      selected: selected,
      button: true,
      label: artist.name,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? colors.accent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: AlbumArtwork(
                      coverArt: artist.coverArt ??
                          artist.artistImageUrl ??
                          (artist.id.isNotEmpty ? 'ar-${artist.id}' : null),
                      size: size - 10,
                      borderRadius: size,
                      shadow: const BoxShadow(color: Colors.transparent),
                    ),
                  ),
                ),
                if (selected && !compact)
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: colors.accent,
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.background, width: 2),
                      ),
                      child: Icon(Icons.check_rounded,
                          size: 14, color: colors.onAccent),
                    ),
                  ),
              ],
            ),
            SizedBox(height: compact ? 4 : 8),
            Text(
              artist.name,
              maxLines: compact ? 1 : 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: compact ? 12 : 13,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? colors.text1 : colors.text2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
