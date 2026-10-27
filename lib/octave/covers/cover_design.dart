import 'package:flutter/material.dart';

/// Layouts offered by the playlist cover editor.
enum CoverTemplate {
  /// Title over a two-color gradient, like Spotify's mixes.
  gradient,

  /// Plain color with a small title in a corner.
  minimal,

  /// Two plain colors split on the diagonal.
  duo,

  /// Huge words, one per line, cropped by the right edge.
  bigType,

  /// Geometric shapes in the two colors.
  shapes,

  /// Black record with a color label.
  vinyl,

  /// Picture on top and a color band with the title.
  band,

  /// Full picture with the title over a shade.
  photo,

  /// Picture inside a color frame, with the title under it.
  frame,

  /// Covers of the playlist: nine, four, or the first one.
  grid;

  /// Whether the layout shows a picture (photo or playlist cover).
  bool get usesImage => this == band || this == photo || this == frame;

  static CoverTemplate fromName(String? name) => CoverTemplate.values
      .firstWhere((t) => t.name == name, orElse: () => CoverTemplate.gradient);
}

/// Title fonts, all bundled with the app (SIL Open Font License).
enum CoverFont {
  inter('Inter', FontWeight.w700),
  bebas('BebasNeue', FontWeight.w400),
  serif('DMSerifDisplay', FontWeight.w400),
  mono('SpaceMono', FontWeight.w700),
  script('Pacifico', FontWeight.w400);

  const CoverFont(this.family, this.weight);

  final String family;
  final FontWeight weight;

  static CoverFont fromName(String? name) => CoverFont.values
      .firstWhere((f) => f.name == name, orElse: () => CoverFont.inter);
}

/// Size of the title, as a share of the size each layout gives it.
enum CoverTextSize {
  small(0.8),
  medium(1.0),
  large(1.25);

  const CoverTextSize(this.factor);

  final double factor;

  static CoverTextSize fromName(String? name) => CoverTextSize.values
      .firstWhere((s) => s.name == name, orElse: () => CoverTextSize.medium);
}

/// Effect applied to the picture of picture layouts.
enum CoverImageEffect {
  none,

  /// Black and white.
  mono,

  /// The picture takes the hue of the main color, keeping its light and
  /// shade.
  tint;

  static CoverImageEffect fromName(String? name) => CoverImageEffect.values
      .firstWhere((e) => e.name == name, orElse: () => CoverImageEffect.none);
}

/// Everything needed to draw a custom playlist cover again, so it can be
/// reopened and changed later, which Spotify does not allow.
@immutable
class CoverDesign {
  const CoverDesign({
    this.template = CoverTemplate.gradient,
    required this.title,
    this.subtitle = '',
    this.font = CoverFont.inter,
    this.uppercase = false,
    required this.color1,
    required this.color2,
    this.imagePath,
    this.textSize = CoverTextSize.medium,
    this.centered = false,
    this.imageScale = 1,
    this.imageX = 0,
    this.imageY = 0,
    this.imageEffect = CoverImageEffect.none,
  });

  final CoverTemplate template;
  final String title;
  final String subtitle;
  final CoverFont font;
  final bool uppercase;

  /// Main color (background), and second color (gradient end, shapes,
  /// big type).
  final Color color1;
  final Color color2;

  /// Photo picked by the user, copied into the cover folder. Without it,
  /// picture layouts use the first cover of the playlist.
  final String? imagePath;

  final CoverTextSize textSize;

  /// Title and subtitle centered instead of at the left margin.
  final bool centered;

  /// Framing of the picture: zoom (1 to [maxImageScale]) and the point
  /// kept in view, from -1 (left, top) to 1 (right, bottom).
  final double imageScale;
  final double imageX;
  final double imageY;

  final CoverImageEffect imageEffect;

  static const double maxImageScale = 4;

  /// Whether the picture was moved or zoomed.
  bool get isFramed => imageScale != 1 || imageX != 0 || imageY != 0;

  String get displayTitle => uppercase ? title.toUpperCase() : title;
  String get displaySubtitle => uppercase ? subtitle.toUpperCase() : subtitle;

  CoverDesign copyWith({
    CoverTemplate? template,
    String? title,
    String? subtitle,
    CoverFont? font,
    bool? uppercase,
    Color? color1,
    Color? color2,
    String? imagePath,
    bool clearImage = false,
    CoverTextSize? textSize,
    bool? centered,
    double? imageScale,
    double? imageX,
    double? imageY,
    CoverImageEffect? imageEffect,
  }) {
    return CoverDesign(
      template: template ?? this.template,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      font: font ?? this.font,
      uppercase: uppercase ?? this.uppercase,
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      imagePath: clearImage ? null : (imagePath ?? this.imagePath),
      textSize: textSize ?? this.textSize,
      centered: centered ?? this.centered,
      imageScale:
          (imageScale ?? this.imageScale).clamp(1.0, maxImageScale).toDouble(),
      imageX: (imageX ?? this.imageX).clamp(-1.0, 1.0).toDouble(),
      imageY: (imageY ?? this.imageY).clamp(-1.0, 1.0).toDouble(),
      imageEffect: imageEffect ?? this.imageEffect,
    );
  }

  /// The same design with the picture back to its default framing.
  CoverDesign recentered() => copyWith(imageScale: 1, imageX: 0, imageY: 0);

  Map<String, dynamic> toJson() => {
        'version': 2,
        'template': template.name,
        'title': title,
        'subtitle': subtitle,
        'font': font.name,
        'uppercase': uppercase,
        'color1': color1.toARGB32(),
        'color2': color2.toARGB32(),
        if (imagePath != null) 'imagePath': imagePath,
        'textSize': textSize.name,
        'centered': centered,
        'imageScale': imageScale,
        'imageX': imageX,
        'imageY': imageY,
        'imageEffect': imageEffect.name,
      };

  factory CoverDesign.fromJson(Map<String, dynamic> json) {
    return CoverDesign(
      template: CoverTemplate.fromName(json['template'] as String?),
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      font: CoverFont.fromName(json['font'] as String?),
      uppercase: json['uppercase'] as bool? ?? false,
      color1: Color(json['color1'] as int? ?? 0xFF0E2A47),
      color2: Color(json['color2'] as int? ?? 0xFFA8C9F6),
      imagePath: json['imagePath'] as String?,
      textSize: CoverTextSize.fromName(json['textSize'] as String?),
      centered: json['centered'] as bool? ?? false,
      imageScale: _double(json['imageScale'], 1).clamp(1.0, maxImageScale),
      imageX: _double(json['imageX'], 0).clamp(-1.0, 1.0),
      imageY: _double(json['imageY'], 0).clamp(-1.0, 1.0),
      imageEffect: CoverImageEffect.fromName(json['imageEffect'] as String?),
    );
  }

  static double _double(Object? value, double fallback) =>
      value is num && value.isFinite ? value.toDouble() : fallback;

  @override
  bool operator ==(Object other) =>
      other is CoverDesign &&
      other.template == template &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.font == font &&
      other.uppercase == uppercase &&
      other.color1 == color1 &&
      other.color2 == color2 &&
      other.imagePath == imagePath &&
      other.textSize == textSize &&
      other.centered == centered &&
      other.imageScale == imageScale &&
      other.imageX == imageX &&
      other.imageY == imageY &&
      other.imageEffect == imageEffect;

  @override
  int get hashCode => Object.hash(
        template,
        title,
        subtitle,
        font,
        uppercase,
        color1,
        color2,
        imagePath,
        textSize,
        centered,
        imageScale,
        imageX,
        imageY,
        imageEffect,
      );
}
