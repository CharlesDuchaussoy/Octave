import 'dart:io';

import 'package:flutter/material.dart';

import '../../widgets/common/album_artwork.dart';
import 'cover_design.dart';

/// Draws a custom playlist cover at any [size]: every measure is a share
/// of the size, so the editor thumbnails, the preview and the exported
/// 1200 px image look the same.
///
/// [covers] are the artwork ids of the playlist songs, used by the
/// mosaic and, without a photo, by the picture layouts.
class CoverArt extends StatelessWidget {
  const CoverArt({
    super.key,
    required this.design,
    required this.size,
    this.covers = const [],
  });

  final CoverDesign design;
  final double size;
  final List<String> covers;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ClipRect(child: _layout()),
    );
  }

  Widget _layout() {
    final s = size;
    final c1 = design.color1;
    final c2 = design.color2;
    switch (design.template) {
      case CoverTemplate.gradient:
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [c1, c2],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(s * 0.08),
            child: _textBlock(
              on: _onColor(Color.lerp(c1, c2, 0.4)!),
              titleSize: s * 0.13,
              alignEnd: true,
            ),
          ),
        );

      case CoverTemplate.minimal:
        return ColoredBox(
          color: c1,
          child: Padding(
            padding: EdgeInsets.all(s * 0.08),
            child: _textBlock(on: _onColor(c1), titleSize: s * 0.085),
          ),
        );

      case CoverTemplate.bigType:
        final on = _onColor(c1);
        return ColoredBox(
          color: c1,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                left: -s * 0.03,
                top: -s * 0.05,
                width: s * 1.4,
                child: Text(
                  design.title.toUpperCase(),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  style: _style(s * 0.4, c2, height: 0.86),
                ),
              ),
              if (design.subtitle.isNotEmpty)
                Positioned(
                  left: s * 0.07,
                  right: s * 0.07,
                  bottom: s * 0.06,
                  child: Text(
                    design.displaySubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: _style(s * 0.05, on, weight: FontWeight.w600),
                  ),
                ),
            ],
          ),
        );

      case CoverTemplate.band:
        return Column(
          children: [
            Expanded(child: _picture()),
            Container(
              height: s * 0.3,
              width: double.infinity,
              color: c1,
              padding: EdgeInsets.symmetric(horizontal: s * 0.07),
              alignment: Alignment.centerLeft,
              child: _textBlock(
                on: _onColor(c1),
                titleSize: s * 0.085,
                maxTitleLines: 2,
                center: true,
              ),
            ),
          ],
        );

      case CoverTemplate.photo:
        return Stack(
          fit: StackFit.expand,
          children: [
            _picture(),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00000000), Color(0xA6000000)],
                  stops: [0.4, 1],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(s * 0.07),
              child: _textBlock(
                on: const Color(0xFFFFFFFF),
                titleSize: s * 0.11,
                alignEnd: true,
              ),
            ),
          ],
        );

      case CoverTemplate.vinyl:
        final labelOn = _onColor(c1);
        return ColoredBox(
          color: c2,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _circle(s * 0.86, const Color(0xFF121212)),
                for (final r in const [0.8, 0.72, 0.64, 0.56, 0.48])
                  Container(
                    width: s * r,
                    height: s * r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0x14FFFFFF),
                        width: s * 0.003,
                      ),
                    ),
                  ),
                _circle(s * 0.38, c1),
                // Title above the center hole, subtitle under it.
                SizedBox(
                  width: s * 0.3,
                  height: s * 0.34,
                  child: Column(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            design.displayTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: _style(
                                _fit(s * 0.05, design.title, 12), labelOn,
                                height: 1.05),
                          ),
                        ),
                      ),
                      SizedBox(height: s * 0.06),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            design.displaySubtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: _style(s * 0.026, labelOn,
                                weight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _circle(s * 0.03, c2),
              ],
            ),
          ),
        );

      case CoverTemplate.shapes:
        final soft = Color.lerp(c2, c1, 0.45)!;
        final light = Color.lerp(c2, const Color(0xFFFFFFFF), 0.35)!;
        return ColoredBox(
          color: c1,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                right: -s * 0.2,
                bottom: -s * 0.2,
                child: _circle(s * 0.78, c2),
              ),
              Positioned(
                left: 0,
                bottom: s * 0.1,
                child: Container(
                  width: s * 0.2,
                  height: s * 0.4,
                  decoration: BoxDecoration(
                    color: soft,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(s * 0.2),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: s * 0.12,
                top: s * 0.12,
                child: Transform.rotate(
                  angle: 0.785,
                  child: Container(
                    width: s * 0.13,
                    height: s * 0.13,
                    color: light,
                  ),
                ),
              ),
              Positioned(
                left: s * 0.07,
                top: s * 0.07,
                right: s * 0.32,
                child: _textBlock(on: _onColor(c1), titleSize: s * 0.09),
              ),
            ],
          ),
        );

      case CoverTemplate.grid:
        final tiles = covers.isEmpty
            ? const <String>[]
            : List.generate(9, (i) => covers[i % covers.length]);
        final cell = s / 3;
        return ColoredBox(
          color: c1,
          child: Wrap(
            children: [
              for (final cover in tiles)
                AlbumArtwork(
                  coverArt: cover,
                  size: cell,
                  borderRadius: 0,
                  shadow: const BoxShadow(color: Color(0x00000000)),
                ),
            ],
          ),
        );
    }
  }

  /// Title with its subtitle above it, at the top or at the bottom.
  Widget _textBlock({
    required Color on,
    required double titleSize,
    bool alignEnd = false,
    bool center = false,
    int maxTitleLines = 3,
  }) {
    final hasSubtitle = design.subtitle.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: center
          ? MainAxisAlignment.center
          : (alignEnd ? MainAxisAlignment.end : MainAxisAlignment.start),
      mainAxisSize: center ? MainAxisSize.min : MainAxisSize.max,
      children: [
        if (hasSubtitle && alignEnd) ...[
          _subtitle(on, titleSize),
          SizedBox(height: size * 0.012),
        ],
        Text(
          design.displayTitle,
          maxLines: maxTitleLines,
          overflow: TextOverflow.ellipsis,
          style: _style(_fit(titleSize, design.title, 14), on, height: 1.02),
        ),
        if (hasSubtitle && !alignEnd) ...[
          SizedBox(height: size * 0.015),
          _subtitle(on, titleSize),
        ],
      ],
    );
  }

  Widget _subtitle(Color on, double titleSize) {
    return Text(
      design.displaySubtitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: (titleSize * 0.42).clamp(size * 0.03, size * 0.055),
        fontWeight: FontWeight.w500,
        color: on.withValues(alpha: 0.82),
        height: 1.2,
        decoration: TextDecoration.none,
      ),
    );
  }

  TextStyle _style(
    double fontSize,
    Color color, {
    double height = 1.1,
    FontWeight? weight,
  }) {
    return TextStyle(
      fontFamily: design.font.family,
      fontWeight: weight ?? design.font.weight,
      fontSize: fontSize * _fontScale(design.font),
      color: color,
      height: height,
      letterSpacing: design.font == CoverFont.inter ? -fontSize * 0.02 : 0,
      decoration: TextDecoration.none,
    );
  }

  /// Picture layouts: the user's photo, else the first playlist cover,
  /// else the main color.
  Widget _picture() {
    final path = design.imagePath;
    if (path != null && File(path).existsSync()) {
      return Image.file(
        File(path),
        fit: BoxFit.cover,
        width: size,
        height: size,
        gaplessPlayback: true,
      );
    }
    if (covers.isNotEmpty) {
      return AlbumArtwork(
        coverArt: covers.first,
        size: size,
        borderRadius: 0,
        shadow: const BoxShadow(color: Color(0x00000000)),
      );
    }
    return ColoredBox(color: design.color2);
  }

  static Widget _circle(double d, Color color) => Container(
        width: d,
        height: d,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      );

  /// Shrinks long titles so they keep fitting in their lines.
  static double _fit(double base, String text, int comfortableLength) {
    final length = text.characters.length;
    if (length <= comfortableLength) return base;
    if (length <= comfortableLength * 1.6) return base * 0.8;
    if (length <= comfortableLength * 2.4) return base * 0.66;
    return base * 0.56;
  }

  /// Fonts do not have the same visual size at the same point size.
  static double _fontScale(CoverFont font) => switch (font) {
        CoverFont.inter => 1.0,
        CoverFont.bebas => 1.22,
        CoverFont.serif => 1.05,
        CoverFont.mono => 0.82,
        CoverFont.script => 0.86,
      };

  /// White or near black, whichever reads best on [background].
  static Color _onColor(Color background) =>
      background.computeLuminance() > 0.42
          ? const Color(0xFF141414)
          : const Color(0xFFFFFFFF);
}
