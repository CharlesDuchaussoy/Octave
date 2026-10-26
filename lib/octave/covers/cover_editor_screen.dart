import 'dart:convert';
import 'dart:typed_data';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/models.dart';
import '../../providers/library_provider.dart';
import '../../services/palette_service.dart';
import '../../services/subsonic_service.dart';
import '../../services/theme_service.dart';
import '../../widgets/common/album_artwork.dart';
import '../theme/octave_theme.dart';
import 'cover_art.dart';
import 'cover_design.dart';
import 'cover_store.dart';

/// Editor of custom playlist covers, in the spirit of Spotify's "Create
/// cover": a large preview, then four tabs (layout, text, colors,
/// picture). The design is kept with the image, so the cover can be
/// reopened and changed.
class PlaylistCoverEditor extends StatefulWidget {
  const PlaylistCoverEditor({super.key, required this.playlist});

  final Playlist playlist;

  /// Full-screen route of the editor, to push on the root navigator so it
  /// covers the tab bar.
  static Route<void> route(Playlist playlist) => MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => PlaylistCoverEditor(playlist: playlist),
      );

  /// Opens the editor above the tab bar.
  static Future<void> open(BuildContext context, Playlist playlist) =>
      Navigator.of(context, rootNavigator: true).push(route(playlist));

  @override
  State<PlaylistCoverEditor> createState() => _PlaylistCoverEditorState();
}

class _PlaylistCoverEditorState extends State<PlaylistCoverEditor> {
  final _previewKey = GlobalKey();
  final _title = TextEditingController();
  final _subtitle = TextEditingController();

  CoverDesign? _design;
  CoverDesign? _initial;
  List<String> _covers = const [];
  List<Color> _coverColors = const [];
  int _tab = 0;
  bool _saving = false;
  late bool _hasCustom;

  bool get _dirty => _design != null && _design != _initial;

  @override
  void initState() {
    super.initState();
    _hasCustom =
        PlaylistCoverStore.instance.imagePath(widget.playlist.id) != null;
    _load();
  }

  @override
  void dispose() {
    _title.dispose();
    _subtitle.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final saved =
        await PlaylistCoverStore.instance.design(widget.playlist.id) ??
            await _serverDesign();
    if (!mounted) return;
    final design = saved ?? _defaultDesign();
    _title.text = design.title;
    _subtitle.text = design.subtitle;
    setState(() {
      _design = design;
      _initial = design;
    });

    var songs = widget.playlist.songs ?? const <Song>[];
    if (songs.isEmpty) {
      try {
        final library = Provider.of<LibraryProvider>(context, listen: false);
        songs = (await library.getPlaylist(widget.playlist.id)).songs ?? [];
      } catch (_) {}
    }
    final covers = <String>[];
    for (final song in songs) {
      final cover = song.coverArt;
      if (cover != null && cover.isNotEmpty && !covers.contains(cover)) {
        covers.add(cover);
      }
    }
    if (!mounted) return;
    setState(() => _covers = covers);
    _loadCoverColors(covers.take(3).toList());
  }

  /// Design kept by Octo, when the cover was made on another device.
  Future<CoverDesign?> _serverDesign() async {
    try {
      final subsonic = Provider.of<SubsonicService>(context, listen: false);
      final raw =
          await subsonic.octoGetPlaylistImageSettings(widget.playlist.id);
      if (raw == null || raw.isEmpty) return null;
      final design =
          CoverDesign.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      if (mounted) setState(() => _hasCustom = true);
      return design;
    } catch (e) {
      debugPrint('[PlaylistCoverEditor] no design on the server: $e');
      return null;
    }
  }

  /// Sends the cover to the server through Octo, so Arpeggi, the web
  /// player and Octave on other devices show it. False when the server
  /// has no Octo or refuses (playlist of another account, or generated).
  Future<bool> _upload(CoverDesign design, Uint8List png) async {
    try {
      final subsonic = Provider.of<SubsonicService>(context, listen: false);
      final library = Provider.of<LibraryProvider>(context, listen: false);
      // The photo path only makes sense on this device.
      final shared = design.copyWith(clearImage: true);
      await subsonic.octoSetPlaylistImage(
        widget.playlist.id,
        png,
        settings: jsonEncode(shared.toJson()),
      );
      library.loadPlaylists().catchError((_) {});
      return true;
    } catch (e) {
      debugPrint('[PlaylistCoverEditor] upload failed: $e');
      return false;
    }
  }

  /// Colors picked from the first covers of the playlist.
  Future<void> _loadCoverColors(List<String> covers) async {
    final subsonic = Provider.of<SubsonicService>(context, listen: false);
    final found = <Color>[];
    for (final cover in covers) {
      try {
        final colors = await PaletteService.extractColors(
          coverImageProvider(subsonic, cover, size: 300),
          'cover_editor_$cover',
        );
        for (final color in colors.take(2)) {
          if (!found.any((c) => _close(c, color))) found.add(color);
        }
      } catch (_) {}
    }
    if (mounted) setState(() => _coverColors = found.take(6).toList());
  }

  static bool _close(Color a, Color b) =>
      (a.r - b.r).abs() + (a.g - b.g).abs() + (a.b - b.b).abs() < 0.12;

  CoverDesign _defaultDesign() {
    final theme = Provider.of<ThemeService>(context, listen: false);
    final seed = theme.accentColor.isDynamic
        ? AccentColor.octave.color
        : theme.accentColor.color;
    return CoverDesign(
      title: widget.playlist.name,
      color1: seed,
      color2: _partner(seed),
    );
  }

  /// A light tint of [color], same hue, for gradients: shifting the hue
  /// turned blues into purple.
  static Color _partner(Color color) {
    final hct = Hct.fromInt(color.toARGB32());
    return Color(Hct.from(hct.hue, math.max(hct.chroma, 30), 80).toInt());
  }

  void _update(CoverDesign design) => setState(() => _design = design);

  Future<void> _save() async {
    final design = _design;
    if (design == null || _saving) return;
    final l10n = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    setState(() => _saving = true);
    try {
      final boundary = _previewKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
      final image =
          await boundary.toImage(pixelRatio: 1200 / boundary.size.width);
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      final png = data!.buffer.asUint8List();
      await PlaylistCoverStore.instance.save(widget.playlist.id, design, png);
      final shared = await _upload(design, png);
      _initial = design;
      messenger.showSnackBar(SnackBar(
        content: Text(shared ? l10n.coverSaved : l10n.coverSavedThisDevice),
      ));
      navigator.pop();
    } catch (e) {
      debugPrint('[PlaylistCoverEditor] save failed: $e');
      if (mounted) setState(() => _saving = false);
      messenger.showSnackBar(SnackBar(content: Text(l10n.coverSaveFailed)));
    }
  }

  Future<void> _backToAutomatic() async {
    final navigator = Navigator.of(context);
    final subsonic = Provider.of<SubsonicService>(context, listen: false);
    final library = Provider.of<LibraryProvider>(context, listen: false);
    await PlaylistCoverStore.instance.remove(widget.playlist.id);
    try {
      await subsonic.octoDeletePlaylistImage(widget.playlist.id);
      library.loadPlaylists().catchError((_) {});
    } catch (e) {
      debugPrint('[PlaylistCoverEditor] server removal failed: $e');
    }
    _initial = _design;
    navigator.pop();
  }

  Future<void> _pickPhoto() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    final path = result?.files.single.path;
    if (path == null || _design == null) return;
    final design = _design!;
    _update(design.copyWith(
      imagePath: path,
      template: design.template.usesImage ? null : CoverTemplate.photo,
    ));
  }

  Future<bool> _confirmDiscard() async {
    final l10n = AppLocalizations.of(context)!;
    final discard = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.coverDiscardTitle),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.coverDiscard),
          ),
        ],
      ),
    );
    return discard ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    final design = _design;

    return PopScope(
      canPop: !_dirty,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final navigator = Navigator.of(context);
        if (await _confirmDiscard()) {
          _initial = _design;
          navigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: colors.background,
        appBar: AppBar(
          backgroundColor: colors.background,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.xmark),
            tooltip: l10n.cancel,
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text(l10n.coverEditorTitle),
          actions: [
            TextButton(
              onPressed: design == null || _saving ? null : _save,
              child: Text(
                l10n.save,
                style: TextStyle(
                  color: colors.accent,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: design == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _preview(design),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl<int>(
                        groupValue: _tab,
                        backgroundColor: colors.surface2,
                        thumbColor: colors.surface1,
                        onValueChanged: (v) => setState(() => _tab = v ?? 0),
                        children: {
                          for (final (i, label) in [
                            l10n.coverTabTemplate,
                            l10n.coverTabText,
                            l10n.coverTabColors,
                            l10n.coverTabImage,
                          ].indexed)
                            i: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                label,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: colors.text1,
                                ),
                              ),
                            ),
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(
                        16,
                        20,
                        16,
                        24 + MediaQuery.paddingOf(context).bottom,
                      ),
                      children: switch (_tab) {
                        0 => _templateTab(design),
                        1 => _textTab(design),
                        2 => _colorsTab(design),
                        _ => _imageTab(design),
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _preview(CoverDesign design) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final side = math.min(
          constraints.maxWidth - 96,
          MediaQuery.sizeOf(context).height * 0.36,
        );
        return Padding(
          padding: const EdgeInsets.fromLTRB(48, 4, 48, 20),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: RepaintBoundary(
                key: _previewKey,
                child: CoverArt(design: design, size: side, covers: _covers),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _templateTab(CoverDesign design) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    return [
      LayoutBuilder(
        builder: (context, constraints) {
          const spacing = 12.0;
          final tile = (constraints.maxWidth - spacing * 3) / 4;
          return Wrap(
            spacing: spacing,
            runSpacing: 14,
            children: [
              for (final template in CoverTemplate.values)
                GestureDetector(
                  onTap: () => _update(design.copyWith(template: template)),
                  child: SizedBox(
                    width: tile,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: design.template == template
                                  ? colors.accent
                                  : Colors.transparent,
                              width: 2.5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CoverArt(
                              design: design.copyWith(template: template),
                              size: tile - 10,
                              covers: _covers,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _templateName(l10n, template),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: design.template == template
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: design.template == template
                                ? colors.text1
                                : colors.text2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      const SizedBox(height: 24),
      Text(
        l10n.coverSharedNote,
        style: TextStyle(fontSize: 13, color: colors.text3),
      ),
      if (_hasCustom) ...[
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: _backToAutomatic,
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              l10n.coverAutomatic,
              style: TextStyle(color: colors.danger),
            ),
          ),
        ),
      ],
    ];
  }

  List<Widget> _textTab(CoverDesign design) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    return [
      TextField(
        controller: _title,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: l10n.coverTitleLabel),
        onChanged: (v) => _update(design.copyWith(title: v)),
      ),
      const SizedBox(height: 12),
      TextField(
        controller: _subtitle,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: l10n.coverSubtitleLabel,
          hintText: l10n.coverSubtitleHint,
        ),
        onChanged: (v) => _update(design.copyWith(subtitle: v)),
      ),
      const SizedBox(height: 20),
      _label(l10n.coverFontLabel),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final font in CoverFont.values)
            _Choice(
              selected: design.font == font,
              onTap: () => _update(design.copyWith(font: font)),
              child: Text(
                _fontName(font),
                style: TextStyle(
                  fontFamily: font.family,
                  fontWeight: font.weight,
                  fontSize: font == CoverFont.bebas ? 18 : 15,
                  color:
                      design.font == font ? colors.onAccentSoft : colors.text1,
                ),
              ),
            ),
        ],
      ),
      const SizedBox(height: 12),
      SwitchListTile.adaptive(
        contentPadding: EdgeInsets.zero,
        title: Text(l10n.coverUppercase),
        value: design.uppercase,
        onChanged: (v) => _update(design.copyWith(uppercase: v)),
      ),
    ];
  }

  List<Widget> _colorsTab(CoverDesign design) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.octave;
    // The app colors, a light partner of each, then neutrals.
    final palette = [
      for (final accent in AccentColor.values)
        if (!accent.isDynamic) accent.color,
      for (final accent in AccentColor.values)
        if (!accent.isDynamic && accent != AccentColor.octave)
          _partner(accent.color),
      const Color(0xFFFFFFFF),
      const Color(0xFFF3E9DC),
      const Color(0xFF121212),
    ];

    // One scrolling row: colors of the playlist covers first, then the
    // palette, after a thin separator.
    Widget picker(Color selected, ValueChanged<Color> onPick) => SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final color in _coverColors)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: _Swatch(
                    color: color,
                    selected: color == selected,
                    onTap: () => onPick(color),
                  ),
                ),
              if (_coverColors.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 6, 12, 6),
                  child: VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: colors.separator,
                  ),
                ),
              for (final color in palette)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: _Swatch(
                    color: color,
                    selected: color == selected,
                    onTap: () => onPick(color),
                  ),
                ),
            ],
          ),
        );

    return [
      _label(l10n.coverMainColor),
      picker(design.color1, (c) => _update(design.copyWith(color1: c))),
      const SizedBox(height: 24),
      _label(l10n.coverSecondColor),
      picker(design.color2, (c) => _update(design.copyWith(color2: c))),
      const SizedBox(height: 24),
      // Quick way to try the two colors the other way round.
      Align(
        alignment: Alignment.centerLeft,
        child: OutlinedButton.icon(
          onPressed: () => _update(design.copyWith(
            color1: design.color2,
            color2: design.color1,
          )),
          icon: const Icon(CupertinoIcons.arrow_right_arrow_left),
          label: Text(l10n.coverSwapColors),
        ),
      ),
      if (_coverColors.isNotEmpty) ...[
        const SizedBox(height: 16),
        Text(
          l10n.coverColorsFromCovers,
          style: TextStyle(fontSize: 12, color: colors.text3),
        ),
      ],
    ];
  }

  List<Widget> _imageTab(CoverDesign design) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    return [
      Text(
        l10n.coverImageHint,
        style: TextStyle(fontSize: 14, color: colors.text2),
      ),
      const SizedBox(height: 16),
      FilledButton.tonalIcon(
        onPressed: _pickPhoto,
        icon: const Icon(CupertinoIcons.photo),
        label: Text(l10n.coverPickPhoto),
      ),
      const SizedBox(height: 8),
      OutlinedButton.icon(
        onPressed: design.imagePath == null
            ? null
            : () => _update(design.copyWith(clearImage: true)),
        icon: const Icon(CupertinoIcons.square_grid_2x2),
        label: Text(l10n.coverUsePlaylistCovers),
      ),
    ];
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: context.octave.text2,
          ),
        ),
      );

  static String _fontName(CoverFont font) => switch (font) {
        CoverFont.inter => 'Inter',
        CoverFont.bebas => 'BEBAS NEUE',
        CoverFont.serif => 'DM Serif',
        CoverFont.mono => 'Space Mono',
        CoverFont.script => 'Pacifico',
      };

  static String _templateName(AppLocalizations l10n, CoverTemplate t) =>
      switch (t) {
        CoverTemplate.gradient => l10n.coverTemplateGradient,
        CoverTemplate.minimal => l10n.coverTemplateMinimal,
        CoverTemplate.bigType => l10n.coverTemplateBigType,
        CoverTemplate.band => l10n.coverTemplateBand,
        CoverTemplate.photo => l10n.coverTemplatePhoto,
        CoverTemplate.vinyl => l10n.coverTemplateVinyl,
        CoverTemplate.shapes => l10n.coverTemplateShapes,
        CoverTemplate.grid => l10n.coverTemplateGrid,
      };
}

class _Choice extends StatelessWidget {
  const _Choice({
    required this.selected,
    required this.onTap,
    required this.child,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? colors.accentSoft : colors.surface1,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? colors.accent : colors.separator,
          ),
        ),
        child: child,
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? colors.text1 : colors.separator,
            width: selected ? 2 : 1,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}
