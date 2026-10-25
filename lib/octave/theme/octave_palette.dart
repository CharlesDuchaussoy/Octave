import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'octave_colors.dart';

/// Computes every [OctaveColors] token from one seed color.
///
/// Colors are built in Google's HCT color space (hue, chroma, tone): the
/// seed gives the hue, each token gets a fixed tone (lightness), so
/// contrast stays readable whatever the seed. [intensity] sets how much
/// of the seed tints backgrounds and surfaces: 0 is neutral grey and
/// only the accent changes, 1 gives clearly colored backgrounds.
class OctavePalette {
  OctavePalette._();

  /// Night blue of the Octave logo, the default seed.
  static const Color octaveSeed = Color(0xFF0E2A47);

  static const double defaultIntensity = 0.5;

  static OctaveColors build({
    required Color seed,
    required Brightness brightness,
    double intensity = defaultIntensity,
    bool pureBlack = false,
  }) {
    final hct = Hct.fromInt(seed.toARGB32());
    final hue = hct.hue;
    final seedChroma = hct.chroma;
    final tint = intensity.clamp(0.0, 1.0);
    final neutral = math.min(seedChroma, 28.0) * tint;
    final accentChroma = math.max(seedChroma, 32.0);

    Color c(double tone, double chroma, [double h = -1]) =>
        Color(Hct.from(h < 0 ? hue : h, chroma, tone).toInt());

    if (brightness == Brightness.dark) {
      final background =
          pureBlack ? const Color(0xFF000000) : c(7, neutral);
      final surface1 = c(pureBlack ? 6 : 11, neutral);
      final accent = c(80, accentChroma);
      return OctaveColors(
        brightness: Brightness.dark,
        background: background,
        backgroundTop: c(22, math.min(seedChroma, 36) * math.max(tint, 0.4)),
        surface1: surface1,
        surface2: c(pureBlack ? 10 : 15, neutral),
        surface3: c(pureBlack ? 15 : 21, neutral),
        separator: c(pureBlack ? 20 : 26, neutral * 0.8),
        text1: c(98, math.min(neutral, 4)),
        text2: c(74, neutral * 0.5),
        text3: c(54, neutral * 0.5),
        accent: accent,
        onAccent: c(12, math.min(accentChroma, 30)),
        accentSoft: c(26, math.max(seedChroma * 0.8, 16)),
        onAccentSoft: c(90, math.max(seedChroma * 0.5, 12)),
        bar: pureBlack ? c(4, neutral) : surface1,
        miniPlayer: c(pureBlack ? 8 : 15, neutral),
        glass: background.withValues(alpha: 0.78),
        progress: accent,
        progressTrack: c(30, neutral),
        success: c(72, 50, 145),
        warning: c(78, 55, 75),
        danger: c(68, 60, 25),
      );
    }

    final background = c(97, neutral * 0.5);
    final accent = c(hct.tone.clamp(16.0, 45.0), math.max(seedChroma, 24.0));
    return OctaveColors(
      brightness: Brightness.light,
      background: background,
      backgroundTop: c(88, math.min(seedChroma, 36) * math.max(tint, 0.4)),
      surface1: const Color(0xFFFFFFFF),
      surface2: c(94, neutral * 0.6),
      surface3: c(90, neutral * 0.6),
      separator: c(87, neutral * 0.5),
      text1: c(10, math.min(neutral, 6)),
      text2: c(40, neutral * 0.6),
      text3: c(56, neutral * 0.5),
      accent: accent,
      onAccent: const Color(0xFFFFFFFF),
      accentSoft: c(90, math.max(seedChroma * 0.4, 12)),
      onAccentSoft: c(20, math.max(seedChroma, 24)),
      bar: const Color(0xFFFFFFFF),
      miniPlayer: const Color(0xFFFFFFFF),
      glass: background.withValues(alpha: 0.82),
      progress: accent,
      progressTrack: c(88, neutral * 0.6),
      success: c(42, 55, 145),
      warning: c(50, 60, 70),
      danger: c(45, 75, 25),
    );
  }
}
