import 'package:flutter/material.dart';

/// Layouts offered by the playlist cover editor.
enum CoverTemplate {
  /// Title over a two-color gradient, like Spotify's mixes.
  gradient,

  /// Plain color with a small title in a corner.
  minimal,

  /// One huge word cropped by the edges.
  bigType,

  /// Picture on top and a color band with the title.
  band,

  /// Full picture with the title over a shade.
  photo,

  /// Black record with a color label.
  vinyl,

  /// Geometric shapes in the two colors.
  shapes,

  /// Nine covers of the playlist.
  grid;

  /// Whether the layout shows a picture (photo or playlist cover).
  bool get usesImage => this == band || this == photo;

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
    );
  }

  Map<String, dynamic> toJson() => {
        'version': 1,
        'template': template.name,
        'title': title,
        'subtitle': subtitle,
        'font': font.name,
        'uppercase': uppercase,
        'color1': color1.toARGB32(),
        'color2': color2.toARGB32(),
        if (imagePath != null) 'imagePath': imagePath,
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
    );
  }

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
      other.imagePath == imagePath;

  @override
  int get hashCode => Object.hash(
      template, title, subtitle, font, uppercase, color1, color2, imagePath);
}
