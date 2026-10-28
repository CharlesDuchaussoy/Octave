import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/models/artist.dart';
import 'package:musly/octave/server/taste_artists.dart';
import 'package:musly/octave/setup/taste_artists_step.dart';

import '../test_helpers.dart';

void main() {
  Artist artist(String id, String name) => Artist(id: id, name: name);

  group('TasteArtists', () {
    test('reads the four lists, in any Subsonic list shape', () {
      final taste = TasteArtists.fromJson({
        'mine': {
          'artist': [
            {'id': 'a1', 'name': 'ABBA'},
          ],
        },
        'france': [
          {'id': 'x1', 'name': 'Stromae', 'isExternal': true},
        ],
        'world': {
          'artist': {'id': 'x2', 'name': 'Taylor Swift'},
        },
        'chosen': {
          'artist': [
            {'name': 'no id'},
          ],
        },
      });

      expect(taste.mine.single.name, 'ABBA');
      expect(taste.france.single.id, 'x1');
      expect(taste.world.single.name, 'Taylor Swift');
      expect(taste.chosen, isEmpty, reason: 'an artist without id is left out');
    });
  });

  group('TasteArtistsStep', () {
    late Map<String, Artist> picked;
    late List<String> searches;

    Widget step(TasteArtists? suggestions) => createTestApp(
          child: StatefulBuilder(
            builder: (context, setState) => SingleChildScrollView(
              child: TasteArtistsStep(
                suggestions: suggestions,
                search: (query) async {
                  searches.add(query);
                  return [artist('x9', 'Angèle')];
                },
                selected: picked,
                onToggle: (a) => setState(() {
                  if (picked.remove(a.id) == null) picked[a.id] = a;
                }),
              ),
            ),
          ),
        );

    setUp(() {
      picked = {};
      searches = [];
    });

    testWidgets('shows each artist once, in its first section',
        (tester) async {
      await tester.pumpWidget(step(TasteArtists(
        mine: [artist('a1', 'ABBA')],
        france: [artist('a1', 'ABBA'), artist('x1', 'Stromae')],
        world: [artist('x2', 'Taylor Swift')],
      )));
      await tester.pump();

      expect(find.text('Your most played'), findsOneWidget);
      expect(find.text('Most played in France'), findsOneWidget);
      expect(find.text('Most played worldwide'), findsOneWidget);
      expect(find.text('ABBA'), findsOneWidget);
    });

    testWidgets('searches from 3 characters and adds the artist picked',
        (tester) async {
      await tester.pumpWidget(step(TasteArtists.empty));
      await tester.pump();

      await tester.enterText(find.byType(TextField), 'an');
      await tester.pump(const Duration(milliseconds: 500));
      expect(searches, isEmpty);

      await tester.enterText(find.byType(TextField), 'ang');
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pump();
      expect(searches, ['ang']);

      await tester.tap(find.text('Angèle'));
      await tester.pump();
      expect(picked.keys, ['x9']);
      expect(find.text('Your picks (1)'), findsOneWidget);
    });
  });
}
