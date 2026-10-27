import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/models/song.dart';
import 'package:musly/octave/home/resume_banner.dart';
import 'package:musly/octave/server/queue_handoff.dart';

void main() {
  Song song(String id, {bool local = false, bool external = false}) =>
      Song(id: id, title: id, isLocal: local, isExternal: external);

  group('serverQueuePlan', () {
    test('keeps library songs and the current index', () {
      final plan = serverQueuePlan([song('a'), song('b'), song('c')], 1);
      expect(plan!.ids, ['a', 'b', 'c']);
      expect(plan.index, 1);
    });

    test('leaves out phone files and outside songs, the index follows', () {
      final plan = serverQueuePlan([
        song('x', external: true),
        song('a'),
        song('p', local: true),
        song('b'),
      ], 3);
      expect(plan!.ids, ['a', 'b']);
      expect(plan.index, 1);
    });

    test('an outside current song hands over to the next library song', () {
      final plan =
          serverQueuePlan([song('a'), song('x', external: true), song('b')], 1);
      expect(plan!.index, 1);
      expect(plan.ids[plan.index], 'b');
    });

    test('falls back to the previous song at the end of the queue', () {
      final plan = serverQueuePlan([song('a'), song('x', external: true)], 1);
      expect(plan!.ids[plan.index], 'a');
    });

    test('saves nothing without a library song', () {
      expect(serverQueuePlan([song('p', local: true)], 0), isNull);
      expect(serverQueuePlan([], 0), isNull);
    });
  });

  group('ServerQueue', () {
    test('reads getPlayQueueByIndex', () {
      final queue = ServerQueue.fromJson({
        'entry': [
          {'id': 'a', 'title': 'A'},
          {'id': 'b', 'title': 'B'},
        ],
        'currentIndex': 1,
        'position': 12345,
        'changed': '2026-10-27T13:27:42.679159868Z',
        'changedBy': 'Arpeggi',
      })!;
      expect(queue.current.id, 'b');
      expect(queue.position, const Duration(milliseconds: 12345));
      expect(queue.changedBy, 'Arpeggi');
      expect(queue.changed.isUtc, isTrue);
    });

    test('is null when the account has no queue', () {
      expect(
        ServerQueue.fromJson({
          'username': 'essai-octave',
          'changed': '0001-01-01T00:00:00Z',
          'changedBy': '',
        }),
        isNull,
      );
    });

    test('keeps a wrong index in range', () {
      final queue = ServerQueue.fromJson({
        'entry': [
          {'id': 'a', 'title': 'A'},
        ],
        'currentIndex': 4,
      })!;
      expect(queue.currentIndex, 0);
    });
  });

  test('songs read the outside flag Octo sends', () {
    expect(
        Song.fromJson({'id': 'a', 'title': 'A', 'isExternal': true}).isExternal,
        isTrue);
    expect(Song.fromJson({'id': 'a', 'title': 'A'}).isExternal, isFalse);
  });

  testWidgets('says how long ago, in French', (tester) async {
    late AppLocalizations l10n;
    await tester.pumpWidget(Localizations(
      locale: const Locale('fr'),
      delegates: AppLocalizations.localizationsDelegates,
      child: Builder(builder: (context) {
        l10n = AppLocalizations.of(context)!;
        return const SizedBox();
      }),
    ));
    final now = DateTime(2026, 10, 27, 12);
    String ago(Duration d) => ResumeQueueBanner.ago(l10n, now.subtract(d), now);
    expect(ago(const Duration(seconds: 20)), "à l'instant");
    expect(ago(const Duration(minutes: 5)), 'il y a 5 min');
    expect(ago(const Duration(hours: 2)), 'il y a 2 h');
    expect(ago(const Duration(days: 1, hours: 2)), 'hier');
    expect(ago(const Duration(days: 3)), 'il y a 3 jours');
  });
}
