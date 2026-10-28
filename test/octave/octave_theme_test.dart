import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/theme/octave_theme.dart';

void main() {
  for (final brightness in Brightness.values) {
    test('headings are bold in ${brightness.name} mode', () {
      final theme = OctaveTheme.build(OctavePalette.build(
        seed: const Color(0xFF0E2A47),
        brightness: brightness,
      ));
      // A style missing from the theme falls back to Material's, which
      // is regular weight: section headings looked out of place.
      for (final style in [
        theme.textTheme.displayLarge,
        theme.textTheme.displayMedium,
        theme.textTheme.headlineLarge,
        theme.textTheme.headlineSmall,
      ]) {
        expect(style?.fontWeight, FontWeight.bold);
      }
      expect(theme.textTheme.headlineSmall?.fontSize, 20);
    });
  }
}
