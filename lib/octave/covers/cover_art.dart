import 'dart:io';

import 'package:flutter/material.dart';

import '../../widgets/common/album_artwork.dart';
import 'cover_design.dart';

/// Gives the image of a playlist cover id at a size in pixels.
typedef CoverImageResolver = ImageProvider Function(String cover, int pixels);

/// Draws a custom playlist cover at any [size]: every measure is a share
/// of the size, so the editor thumbnails, the preview and the exported
/// 1200 px image look the same.
///
/// [covers] are the artwork ids of the playlist songs, used by the
/// mosaic and, without a photo, by the picture layouts. With
/// [coverImage], they are drawn from that resolver at [imagePixelRatio]
/// pixels per point, which lets the editor load them before exporting
/// (see [imageRequests]); without it, they go through [AlbumArtwork].
class CoverArt extends StatelessWidget {
  const CoverArt({
    super.key,
    required this.design,
    required this.size,
    this.covers = const [],
    this.coverImage,
    this.imagePixelRatio = 2,
  });

  final CoverDesign design;
  final double size;
  final List<String> covers;
  final CoverImageResolver? coverImage;
  final double imagePixelRatio;

  /// Covers drawn by [design], with their size in pixels: what the editor
  /// loads before exporting, so the image never shows a placeholder.
  static List<(String, int)> imageRequests(
    CoverDesign design,
    List<String> covers,
    double size, {
    double pixelRatio = 2,
  }) {
    int px(double points) => (points * pixelRatio).round().clamp(1, 1200);
    if (design.template == CoverTemplate.grid) {
      final n = gridSide(covers.length);
      if (n == 0) return const [];
      return [for (final c in covers.take(n * n)) (c, px(size / n))];
    }
    final hasPhoto =
        design.imagePath != null && File(design.imagePath!).existsSync();
    if (design.template.usesImage && !hasPhoto && covers.isNotEmpty) {
      return [(covers.first, px(size))];
    }
    return const [];
  }

  /// Cells per side of the mosaic: nine covers when there are enough,
  /// else four, else the first one alone. Repeating covers looked odd.
  static int gridSide(int coverCount) => coverCount >= 9
      ? 3
      : coverCount >= 4
          ? 2
          : coverCount >= 1
              ? 1
              : 0;

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
        return _bigType();

      case CoverTemplate.band:
        return Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, box) =>
                    _picture(box.maxWidth, box.maxHeight),
              ),
            ),
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
            _picture(s, s),
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

      case CoverTemplate.frame:
        final margin = s * 0.09;
        final pictureHeight = s * 0.6;
        return ColoredBox(
          color: c1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(margin, margin, margin, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: pictureHeight,
                  child: _picture(s - margin * 2, pictureHeight),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: margin * 0.6),
                    child: _textBlock(
                      on: _onColor(c1),
                      titleSize: s * 0.075,
                      maxTitleLines: 2,
                      center: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      case CoverTemplate.duo:
        return ColoredBox(
          color: c1,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipPath(
                clipper: _DiagonalClipper(),
                child: ColoredBox(color: c2),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(s * 0.08, s * 0.08, s * 0.3, 0),
                child: _textBlock(on: _onColor(c1), titleSize: s * 0.11),
              ),
            ],
          ),
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
                                _fit(s * 0.05, design.title, 12) *
                                    design.textSize.factor,
                                labelOn,
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
        final n = gridSide(covers.length);
        if (n == 0) {
          // No covers yet: a plain cover with the title.
          return ColoredBox(
            color: c1,
            child: Padding(
              padding: EdgeInsets.all(s * 0.08),
              child: _textBlock(on: _onColor(c1), titleSize: s * 0.1),
            ),
          );
        }
        final cell = s / n;
        return ColoredBox(
          color: c1,
          child: Wrap(
            children: [
              for (final cover in covers.take(n * n))
                SizedBox.square(
                  dimension: cell,
                  child: _cover(cover, cell),
                ),
            ],
          ),
        );
    }
  }

  /// One huge word per line, cropped by the right edge rather than broken
  /// in the middle ("POCH / ETTE").
  Widget _bigType() {
    final s = size;
    final words = design.title
        .toUpperCase()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();
    final lines = words.length <= 3
        ? words
        : [words[0], words[1], words.sublist(2).join(' ')];
    final fontSize = s * 0.4 * design.textSize.factor;
    return ColoredBox(
      color: design.color1,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            left: -s * 0.03,
            top: -s * 0.05,
            width: s * 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final line in lines)
                  Text(
                    line,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.clip,
                    style: _style(fontSize, design.color2, height: 0.86),
                  ),
              ],
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
                textAlign: design.centered ? TextAlign.center : TextAlign.start,
                style:
                    _style(s * 0.05, _onColor(design.color1), weight: FontWeight.w600),
              ),
            ),
        ],
      ),
    );
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
    final textAlign = design.centered ? TextAlign.center : TextAlign.start;
    final size = titleSize * design.textSize.factor;
    return Column(
      crossAxisAlignment: design.centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: center
          ? MainAxisAlignment.center
          : (alignEnd ? MainAxisAlignment.end : MainAxisAlignment.start),
      mainAxisSize: center ? MainAxisSize.min : MainAxisSize.max,
      children: [
        if (hasSubtitle && alignEnd) ...[
          _subtitle(on, size, textAlign),
          SizedBox(height: this.size * 0.012),
        ],
        Text(
          design.displayTitle,
          maxLines: maxTitleLines,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
          style: _style(_fit(size, design.title, 14), on, height: 1.02),
        ),
        if (hasSubtitle && !alignEnd) ...[
          SizedBox(height: this.size * 0.015),
          _subtitle(on, size, textAlign),
        ],
      ],
    );
  }

  Widget _subtitle(Color on, double titleSize, TextAlign textAlign) {
    return Text(
      design.displaySubtitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
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
  /// else the second color. The photo follows the framing and effect of
  /// the design.
  Widget _picture(double width, double height) {
    final path = design.imagePath;
    Widget? image;
    if (path != null && File(path).existsSync()) {
      image = _framed(FileImage(File(path)), width, height);
    } else if (covers.isNotEmpty) {
      image = _framedCover(covers.first, width, height);
    }
    if (image == null) return ColoredBox(color: design.color2);
    return SizedBox(
      width: width,
      height: height,
      child: ClipRect(child: _effect(image)),
    );
  }

  Widget _framed(ImageProvider provider, double width, double height) {
    final focus = Alignment(design.imageX, design.imageY);
    return Transform.scale(
      scale: design.imageScale,
      alignment: focus,
      child: Image(
        image: provider,
        width: width,
        height: height,
        fit: BoxFit.cover,
        alignment: focus,
        gaplessPlayback: true,
      ),
    );
  }

  Widget _framedCover(String cover, double width, double height) {
    final resolver = coverImage;
    if (resolver != null) {
      final side = width > height ? width : height;
      return _framed(
        resolver(cover, (side * imagePixelRatio).round().clamp(1, 1200)),
        width,
        height,
      );
    }
    return Transform.scale(
      scale: design.imageScale,
      alignment: Alignment(design.imageX, design.imageY),
      child: OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: _cover(cover, width > height ? width : height),
      ),
    );
  }

  /// One playlist cover, square.
  Widget _cover(String cover, double side) {
    final resolver = coverImage;
    if (resolver != null) {
      return Image(
        image: resolver(cover, (side * imagePixelRatio).round().clamp(1, 1200)),
        width: side,
        height: side,
        fit: BoxFit.cover,
        gaplessPlayback: true,
      );
    }
    return AlbumArtwork(
      coverArt: cover,
      size: side,
      borderRadius: 0,
      shadow: const BoxShadow(color: Color(0x00000000)),
    );
  }

  Widget _effect(Widget child) => switch (design.imageEffect) {
        CoverImageEffect.none => child,
        CoverImageEffect.mono => ColorFiltered(
            colorFilter: const ColorFilter.matrix(_greyscale),
            child: child,
          ),
        CoverImageEffect.tint => ColorFiltered(
            colorFilter: ColorFilter.mode(design.color1, BlendMode.color),
            child: child,
          ),
      };

  /// Luminance weights of sRGB (Rec. 709).
  static const List<double> _greyscale = [
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0, 0, 0, 1, 0,
  ];

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

/// Lower right half of the square, for the duo layout.
class _DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width, size.height * 0.28)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width * 0.28, size.height)
    ..close();

  @override
  bool shouldReclip(_DiagonalClipper oldClipper) => false;
}
