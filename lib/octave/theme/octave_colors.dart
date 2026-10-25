import 'package:flutter/material.dart';

import 'octave_palette.dart';

/// Every color of the interface, computed from one seed color by
/// [OctavePalette]. Screens read these tokens through `context.octave`
/// instead of hard-coding colors, so a new seed or mode recolors the
/// whole app.
@immutable
class OctaveColors extends ThemeExtension<OctaveColors> {
  const OctaveColors({
    required this.brightness,
    required this.background,
    required this.backgroundTop,
    required this.surface1,
    required this.surface2,
    required this.surface3,
    required this.separator,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.accent,
    required this.onAccent,
    required this.accentSoft,
    required this.onAccentSoft,
    required this.bar,
    required this.miniPlayer,
    required this.glass,
    required this.progress,
    required this.progressTrack,
    required this.success,
    required this.warning,
    required this.danger,
  });

  final Brightness brightness;

  /// Background of every screen.
  final Color background;

  /// Top of album, playlist and artist headers, faded into [background].
  final Color backgroundTop;

  /// Cards, tiles and sheets, from the lowest to the highest.
  final Color surface1;
  final Color surface2;
  final Color surface3;

  /// Lines between rows and borders.
  final Color separator;

  /// Title, subtitle and discreet text.
  final Color text1;
  final Color text2;
  final Color text3;

  /// Buttons and active elements, and the text or icon drawn on them.
  final Color accent;
  final Color onAccent;

  /// Background of filter chips and selected elements, and its content.
  final Color accentSoft;
  final Color onAccentSoft;

  /// Tab bar and mini player.
  final Color bar;
  final Color miniPlayer;

  /// Tint of blurred (frosted glass) areas.
  final Color glass;

  /// Playback and download progress bars.
  final Color progress;
  final Color progressTrack;

  final Color success;
  final Color warning;
  final Color danger;

  bool get isDark => brightness == Brightness.dark;

  @override
  OctaveColors copyWith({
    Brightness? brightness,
    Color? background,
    Color? backgroundTop,
    Color? surface1,
    Color? surface2,
    Color? surface3,
    Color? separator,
    Color? text1,
    Color? text2,
    Color? text3,
    Color? accent,
    Color? onAccent,
    Color? accentSoft,
    Color? onAccentSoft,
    Color? bar,
    Color? miniPlayer,
    Color? glass,
    Color? progress,
    Color? progressTrack,
    Color? success,
    Color? warning,
    Color? danger,
  }) {
    return OctaveColors(
      brightness: brightness ?? this.brightness,
      background: background ?? this.background,
      backgroundTop: backgroundTop ?? this.backgroundTop,
      surface1: surface1 ?? this.surface1,
      surface2: surface2 ?? this.surface2,
      surface3: surface3 ?? this.surface3,
      separator: separator ?? this.separator,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      text3: text3 ?? this.text3,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      accentSoft: accentSoft ?? this.accentSoft,
      onAccentSoft: onAccentSoft ?? this.onAccentSoft,
      bar: bar ?? this.bar,
      miniPlayer: miniPlayer ?? this.miniPlayer,
      glass: glass ?? this.glass,
      progress: progress ?? this.progress,
      progressTrack: progressTrack ?? this.progressTrack,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
    );
  }

  @override
  OctaveColors lerp(ThemeExtension<OctaveColors>? other, double t) {
    if (other is! OctaveColors) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return OctaveColors(
      brightness: t < 0.5 ? brightness : other.brightness,
      background: l(background, other.background),
      backgroundTop: l(backgroundTop, other.backgroundTop),
      surface1: l(surface1, other.surface1),
      surface2: l(surface2, other.surface2),
      surface3: l(surface3, other.surface3),
      separator: l(separator, other.separator),
      text1: l(text1, other.text1),
      text2: l(text2, other.text2),
      text3: l(text3, other.text3),
      accent: l(accent, other.accent),
      onAccent: l(onAccent, other.onAccent),
      accentSoft: l(accentSoft, other.accentSoft),
      onAccentSoft: l(onAccentSoft, other.onAccentSoft),
      bar: l(bar, other.bar),
      miniPlayer: l(miniPlayer, other.miniPlayer),
      glass: l(glass, other.glass),
      progress: l(progress, other.progress),
      progressTrack: l(progressTrack, other.progressTrack),
      success: l(success, other.success),
      warning: l(warning, other.warning),
      danger: l(danger, other.danger),
    );
  }
}

extension OctaveColorsContext on BuildContext {
  /// The Octave color tokens of the current theme, or the default palette
  /// when the theme was not built by OctaveTheme (tests, isolated widgets).
  OctaveColors get octave {
    final theme = Theme.of(this);
    return theme.extension<OctaveColors>() ??
        (theme.brightness == Brightness.dark ? _defaultDark : _defaultLight);
  }
}

final OctaveColors _defaultDark = OctavePalette.build(
  seed: OctavePalette.octaveSeed,
  brightness: Brightness.dark,
);

final OctaveColors _defaultLight = OctavePalette.build(
  seed: OctavePalette.octaveSeed,
  brightness: Brightness.light,
);
