import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/widgets/now_playing/marquee_text.dart';

void main() {
  const longTitle = 'The Winner Takes It All (Anniversary Edition)';

  Widget frame(Widget child, {bool disableAnimations = false}) {
    return MediaQuery(
      data: MediaQueryData(disableAnimations: disableAnimations),
      child: Directionality(
        textDirection: TextDirection.ltr,
        // The app font comes from the inherited style, as in the player:
        // the title style itself sets no size or family.
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          child: Center(child: SizedBox(width: 200, child: child)),
        ),
      ),
    );
  }

  testWidgets(
      'scrolls a title wider than its space, measured in the '
      'inherited style', (tester) async {
    await tester.pumpWidget(frame(const MarqueeText(
      text: longTitle,
      style: TextStyle(color: Colors.white),
    )));
    await tester.pump();

    final scroll = tester
        .widget<SingleChildScrollView>(find.byType(SingleChildScrollView));
    expect(find.byType(ShaderMask), findsOneWidget);

    // After the pause, the text moves.
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(seconds: 1));
    expect(scroll.controller!.offset, greaterThan(0));

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('leaves a short title still, without fade', (tester) async {
    await tester.pumpWidget(frame(const MarqueeText(text: 'Dancing')));
    await tester.pump();

    expect(find.byType(SingleChildScrollView), findsNothing);
    expect(find.byType(ShaderMask), findsNothing);
    expect(find.text('Dancing'), findsOneWidget);
  });

  testWidgets('ends with an ellipsis when animations are off', (tester) async {
    await tester.pumpWidget(frame(
      const MarqueeText(text: longTitle),
      disableAnimations: true,
    ));
    await tester.pump();

    expect(find.byType(SingleChildScrollView), findsNothing);
    final text = tester.widget<Text>(find.text(longTitle));
    expect(text.overflow, TextOverflow.ellipsis);
  });
}
