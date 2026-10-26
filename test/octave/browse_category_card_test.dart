import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/services/theme_service.dart';
import 'package:musly/widgets/cards/browse_category_card.dart';

double contrast(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final hi = la > lb ? la : lb;
  final lo = la > lb ? lb : la;
  return (hi + 0.05) / (lo + 0.05);
}

void main() {
  test('white text is readable on every browse tile color', () {
    for (final accent in AccentColor.values.where((a) => !a.isDynamic)) {
      final tile = BrowseCategoryCard.tileColor(accent.color);
      expect(contrast(tile, const Color(0xFFFFFFFF)), greaterThanOrEqualTo(4.5),
          reason: accent.name);
    }
  });
}
