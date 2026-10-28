import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// Where the full player takes its background color from.
enum PlayerBackgroundSource {
  /// The main color of the song's cover, like Spotify.
  cover,

  /// The app color chosen in the settings.
  app;

  static PlayerBackgroundSource fromName(String? name) =>
      PlayerBackgroundSource.values.firstWhere(
        (s) => s.name == name,
        orElse: () => PlayerBackgroundSource.cover,
      );
}

/// Background of the full player: one plain dark color, never a glow nor
/// an animation.
///
/// The hue comes from the cover ([coverColor]) or the app color
/// ([appSeed]), and the app settings decide the rest: the color intensity
/// of the theme scales how colorful it is, and pure black gives black.
/// A fixed lightness keeps white text and the app accent readable on any
/// cover (checked by test/octave/player_background_test.dart).
Color playerBackground({
  required Color? coverColor,
  required Color appSeed,
  required double intensity,
  required bool pureBlack,
  PlayerBackgroundSource source = PlayerBackgroundSource.cover,
}) {
  if (pureBlack) return Colors.black;
  final seed = source == PlayerBackgroundSource.cover && coverColor != null
      ? coverColor
      : appSeed;
  final hct = Hct.fromInt(seed.toARGB32());
  final level = intensity.clamp(0.0, 1.0);
  // Grey covers stay grey instead of taking a random hue.
  final chroma = math.min(hct.chroma, 40.0) * (0.3 + 0.7 * level);
  return Color(Hct.from(hct.hue, chroma, _tone).toInt());
}

/// Lightness of the player background, in HCT tone.
const double _tone = 16;
