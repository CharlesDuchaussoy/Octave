import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/theme/octave_palette.dart';
import 'package:musly/services/theme_service.dart';

double contrast(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final hi = la > lb ? la : lb;
  final lo = la > lb ? lb : la;
  return (hi + 0.05) / (lo + 0.05);
}

void main() {
  final seeds = AccentColor.values
      .where((c) => !c.isDynamic)
      .map((c) => c.color)
      .toList();

  group('OctavePalette contrast', () {
    for (final seed in seeds) {
      for (final brightness in Brightness.values) {
        for (final intensity in [0.0, 0.5, 1.0]) {
          for (final pureBlack in [false, true]) {
            if (pureBlack && brightness == Brightness.light) continue;
            final name = '${seed.toARGB32().toRadixString(16)} '
                '${brightness.name} intensity $intensity'
                '${pureBlack ? ' black' : ''}';
            test(name, () {
              final c = OctavePalette.build(
                seed: seed,
                brightness: brightness,
                intensity: intensity,
                pureBlack: pureBlack,
              );
              for (final surface in [c.background, c.surface1, c.surface2]) {
                expect(contrast(c.text1, surface), greaterThanOrEqualTo(7));
                expect(contrast(c.text2, surface), greaterThanOrEqualTo(4.5));
                expect(contrast(c.accent, surface), greaterThanOrEqualTo(3));
              }
              expect(contrast(c.text3, c.background), greaterThanOrEqualTo(3));
              expect(contrast(c.onAccent, c.accent), greaterThanOrEqualTo(4.5));
              expect(contrast(c.onAccentSoft, c.accentSoft),
                  greaterThanOrEqualTo(4.5));
            });
          }
        }
      }
    }
  });

  test('the default seed is the night blue of the logo', () {
    expect(AccentColor.octave.color, const Color(0xFF0E2A47));
    final light = OctavePalette.build(
      seed: OctavePalette.octaveSeed,
      brightness: Brightness.light,
    );
    expect(light.accent, const Color(0xFF0E2A47));
  });
}
