import 'dart:io';

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

    test('only the band, photo and frame layouts show a picture', () {
      expect(
        CoverTemplate.values.where((t) => t.usesImage),
        [CoverTemplate.band, CoverTemplate.photo, CoverTemplate.frame],
      );
    });

    test('keeps the text and picture options through JSON', () {
      final framed = design.copyWith(
        textSize: CoverTextSize.large,
        centered: true,
        imageScale: 2.5,
        imageX: -0.4,
        imageY: 0.7,
        imageEffect: CoverImageEffect.tint,
      );
      expect(CoverDesign.fromJson(framed.toJson()), framed);
      expect(framed.isFramed, isTrue);
      expect(framed.recentered().isFramed, isFalse);
    });

    test('reads a design saved before these options with their defaults',
        () {
      final old = CoverDesign.fromJson({
        'version': 1,
        'template': 'photo',
        'title': 'Mix',
        'color1': 0xFF0E2A47,
        'color2': 0xFFA8C9F6,
      });
      expect(old.textSize, CoverTextSize.medium);
      expect(old.centered, isFalse);
      expect(old.isFramed, isFalse);
      expect(old.imageEffect, CoverImageEffect.none);
    });

    test('keeps the framing in range', () {
      final read = CoverDesign.fromJson({
        'title': 'Mix',
        'imageScale': 12,
        'imageX': -5,
        'imageY': double.nan,
      });
      expect(read.imageScale, CoverDesign.maxImageScale);
      expect(read.imageX, -1);
      expect(read.imageY, 0);
      expect(design.copyWith(imageScale: 0.2).imageScale, 1);
    });
  });

  group('CoverArt.imageRequests', () {
    const covers = ['a', 'b', 'c', 'd', 'e'];
    CoverDesign layout(CoverTemplate t, {String? photo}) => CoverDesign(
          template: t,
          title: 'Mix',
          color1: const Color(0xFF0E2A47),
          color2: const Color(0xFFA8C9F6),
          imagePath: photo,
        );

    test('the mosaic shows nine, four or one cover, never repeated', () {
      expect(CoverArt.gridSide(0), 0);
      expect(CoverArt.gridSide(3), 1);
      expect(CoverArt.gridSide(5), 2);
      expect(CoverArt.gridSide(12), 3);
      expect(
        CoverArt.imageRequests(layout(CoverTemplate.grid), covers, 1200,
            pixelRatio: 1),
        [('a', 600), ('b', 600), ('c', 600), ('d', 600)],
      );
    });

    test('picture layouts load the first cover without a photo', () {
      expect(
        CoverArt.imageRequests(layout(CoverTemplate.frame), covers, 1200,
            pixelRatio: 1),
        [('a', 1200)],
      );
      expect(
        CoverArt.imageRequests(layout(CoverTemplate.gradient), covers, 1200),
        isEmpty,
      );
    });

    test('a photo needs no playlist cover', () {
      final dir = Directory.systemTemp.createTempSync('octave_cover_test');
      addTearDown(() => dir.deleteSync(recursive: true));
      final photo = File('${dir.path}/photo.png')..writeAsBytesSync([1, 2]);
      expect(
        CoverArt.imageRequests(
            layout(CoverTemplate.photo, photo: photo.path), covers, 1200),
        isEmpty,
      );
    });
  });

  group('CoverArt', () {
    testWidgets('big type crops long words instead of breaking them',
        (tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: CoverArt(
            size: 200,
            design: CoverDesign(
              template: CoverTemplate.bigType,
              title: 'Essai pochette',
              color1: const Color(0xFF0E2A47),
              color2: const Color(0xFFA8C9F6),
            ),
          ),
        ),
      ));
      for (final word in ['ESSAI', 'POCHETTE']) {
        final text = tester.widget<Text>(find.text(word));
        expect(text.softWrap, isFalse);
        expect(text.maxLines, 1);
      }
    });

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
                  textSize: size > 100
                      ? CoverTextSize.large
                      : CoverTextSize.small,
                  centered: size > 100,
                  imageScale: 2,
                  imageX: 0.5,
                  imageEffect: CoverImageEffect.mono,
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
