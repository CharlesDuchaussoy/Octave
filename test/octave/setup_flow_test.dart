import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/setup/setup_flow.dart';
import 'package:musly/services/recommendation_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bootstrap.dart';
import '../test_helpers.dart';

void main() {
  initializeTestEnvironment();

  Widget setup() => ChangeNotifierProvider(
        create: (_) => RecommendationService(),
        child: createTestApp(child: SetupFlow(onFinished: () {})),
      );

  /// The setup reads its settings from storage, with real file access.
  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 20 && find.byType(Text).evaluate().isEmpty; i++) {
      await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 100)));
      await tester.pump();
    }
    await tester.pumpAndSettle();
  }

  bool isSelected(WidgetTester tester, String label) {
    final tile = find.ancestor(
      of: find.text(label),
      matching: find.byWidgetPredicate(
          (w) => w is Semantics && w.properties.selected != null),
    );
    return tester.widget<Semantics>(tile.first).properties.selected!;
  }

  testWidgets('a setup closed halfway resumes at its step, with the choices '
      'already made', (tester) async {
    // Closed on the home step, after choosing square covers.
    SharedPreferences.setMockInitialValues({
      'octave_setup_step': 'home',
      'artwork_shape': 'square',
    });
    await tester.pumpWidget(setup());
    await settle(tester);

    expect(find.text('Your home screen'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(isSelected(tester, 'Square'), isTrue);
    expect(isSelected(tester, 'Rounded'), isFalse);
  });

  testWidgets('a step reached again with Back shows what was saved',
      (tester) async {
    // Went back from the home step to the covers step, then closed.
    SharedPreferences.setMockInitialValues({
      'octave_setup_step': 'covers',
      'octave_setup_furthest': 'home',
      // Same as above: PlayerUiSettingsService keeps the storage it read
      // first, for the whole test file.
      'artwork_shape': 'square',
    });
    await tester.pumpWidget(setup());
    await settle(tester);

    expect(find.text('Your covers'), findsOneWidget);
    expect(isSelected(tester, 'Square'), isTrue);
    expect(isSelected(tester, 'Rounded'), isFalse);
  });

  testWidgets('run again from About, it starts at the first step',
      (tester) async {
    SharedPreferences.setMockInitialValues({
      'octave_setup_done': true,
      'octave_setup_step': 'home',
    });
    await tester.pumpWidget(setup());
    await settle(tester);

    expect(find.text('Skip setup'), findsOneWidget);
    expect(find.text('Your home screen'), findsNothing);
  });
}
