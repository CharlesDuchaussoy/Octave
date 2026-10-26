import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/covers/cover_art.dart';
import 'package:musly/octave/covers/cover_design.dart';

void main() {
  const design = CoverDesign(
    template: CoverTemplate.vinyl,
    title: 'Road trip',
    subtitle: 'Pour Léonie',
    font: CoverFont.serif,
    uppercase: true,
    color1: Color(0xFFE0457B),
    color2: Color(0xFFFFB38A),
    imagePath: '/data/cover.jpg',
  );

  group('CoverDesign', () {
    test('survives a JSON round trip', () {
      expect(CoverDesign.fromJson(design.toJson()), design);
    });

    test('falls back to defaults for unknown or missing values', () {
      final read = CoverDesign.fromJson({
        'template': 'hologram',
        'font': 'comic',
        'title': 'Mix',
      });
      expect(read.template, CoverTemplate.gradient);
      expect(read.font, CoverFont.inter);
      expect(read.subtitle, '');
      expect(read.uppercase, isFalse);
      expect(read.imagePath, isNull);
    });

    test('copyWith can drop the photo', () {
      expect(design.copyWith(clearImage: true).imagePath, isNull);
      expect(design.copyWith(title: 'Sport').imagePath, design.imagePath);
    });

    test('capitals apply to the displayed text only', () {
      expect(design.displayTitle, 'ROAD TRIP');
      expect(design.title, 'Road trip');
    });

    test('only the band and photo layouts show a picture', () {
      expect(
        CoverTemplate.values.where((t) => t.usesImage),
        [CoverTemplate.band, CoverTemplate.photo],
      );
    });
  });

  group('CoverArt', () {
    for (final template in CoverTemplate.values) {
      for (final size in [64.0, 320.0]) {
        testWidgets('draws ${template.name} at $size px with a long title',
            (tester) async {
          await tester.pumpWidget(Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: CoverArt(
                size: size,
                design: CoverDesign(
                  template: template,
                  title: 'Les chansons de la route des vacances en famille',
                  subtitle: 'Été 2026, de Lyon à Biarritz',
                  color1: const Color(0xFF0E2A47),
                  color2: const Color(0xFFA8C9F6),
                ),
              ),
            ),
          ));
          expect(tester.takeException(), isNull);
          expect(tester.getSize(find.byType(CoverArt)), Size(size, size));
        });
      }
    }
  });
}
