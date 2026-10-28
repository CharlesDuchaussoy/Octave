import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:musly/octave/theme/octave_palette.dart';
import 'package:musly/octave/theme/player_background.dart';
import 'package:musly/services/theme_service.dart';

double contrast(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final hi = la > lb ? la : lb;
  final lo = la > lb ? lb : la;
  return (hi + 0.05) / (lo + 0.05);
}

void main() {
  const covers = [
    Color(0xFFE53935), // red
    Color(0xFFFFEB3B), // yellow, very light
    Color(0xFF1B5E20), // dark green
    Color(0xFF9E9E9E), // grey
    Color(0xFFFFFFFF), // white
    Color(0xFF000000), // black
    Color(0xFF8E24AA), // purple
  ];

  for (final accent in AccentColor.values.where((a) => !a.isDynamic)) {
    for (final intensity in const [0.0, 0.6, 1.0]) {
      test('${accent.name} at intensity $intensity reads on every cover', () {
        final colors = OctavePalette.build(
          seed: accent.color,
          brightness: Brightness.dark,
          intensity: intensity,
        );
        for (final cover in [...covers, null]) {
          final background = playerBackground(
            coverColor: cover,
            appSeed: colors.accent,
            intensity: intensity,
            pureBlack: false,
          );
          expect(contrast(Colors.white, background), greaterThanOrEqualTo(7),
              reason: 'white on $background');
          expect(contrast(colors.accent, background),
              greaterThanOrEqualTo(3),
              reason: 'accent ${colors.accent} on $background');
        }
      });
    }
  }

  test('pure black gives a black player', () {
    expect(
      playerBackground(
        coverColor: const Color(0xFFE53935),
        appSeed: const Color(0xFFA8C9F6),
        intensity: 1,
        pureBlack: true,
      ),
      Colors.black,
    );
  });

  test('the app color replaces the cover when chosen', () {
    final fromApp = playerBackground(
      coverColor: const Color(0xFFE53935),
      appSeed: const Color(0xFFA8C9F6),
      intensity: 0.6,
      pureBlack: false,
      source: PlayerBackgroundSource.app,
    );
    final hue = Hct.fromInt(fromApp.toARGB32()).hue;
    final blue = Hct.fromInt(const Color(0xFFA8C9F6).toARGB32()).hue;
    expect((hue - blue).abs(), lessThan(8));
  });

  test('a grey cover stays grey, and intensity scales the color', () {
    double chroma(Color c, double intensity) => Hct.fromInt(playerBackground(
          coverColor: c,
          appSeed: const Color(0xFFA8C9F6),
          intensity: intensity,
          pureBlack: false,
        ).toARGB32())
            .chroma;
    expect(chroma(const Color(0xFF9E9E9E), 1), lessThan(4));
    expect(chroma(const Color(0xFFE53935), 0),
        lessThan(chroma(const Color(0xFFE53935), 1)));
  });
}
