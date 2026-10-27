import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/server/playback_reporter.dart';

void main() {
  late List<String> sent;
  late DateTime clock;
  late bool supported;

  PlaybackReporter reporter() => PlaybackReporter(
        send: (id, state, position) async =>
            sent.add('$id $state ${position.inSeconds}'),
        supported: () async => supported,
        now: () => clock,
      );

  Future<void> settle() => Future<void>.delayed(Duration.zero);

  setUp(() {
    sent = [];
    clock = DateTime(2026, 10, 27, 12);
    supported = true;
  });

  test('reports the start near zero, then pause and resume', () async {
    final r = reporter();
    r.observe(songId: 'a', playing: true, position: Duration.zero);
    await settle();
    clock = clock.add(const Duration(seconds: 10));
    r.observe(
        songId: 'a', playing: false, position: const Duration(seconds: 10));
    r.observe(
        songId: 'a', playing: true, position: const Duration(seconds: 10));
    expect(sent, ['a starting 0', 'a paused 10', 'a playing 10']);
    r.dispose();
  });

  test('stays quiet while the song simply goes on', () async {
    final r = reporter();
    r.observe(songId: 'a', playing: true, position: Duration.zero);
    await settle();
    for (var s = 1; s <= 5; s++) {
      clock = clock.add(const Duration(seconds: 1));
      r.observe(songId: 'a', playing: true, position: Duration(seconds: s));
    }
    expect(sent, ['a starting 0']);
    r.dispose();
  });

  test('reports a jump back or forward', () async {
    final r = reporter();
    r.observe(songId: 'a', playing: true, position: Duration.zero);
    await settle();
    clock = clock.add(const Duration(seconds: 30));
    // A replay from the start, the case Octo needs to count again.
    r.observe(songId: 'a', playing: true, position: Duration.zero);
    expect(sent, ['a starting 0', 'a playing 0']);
    r.dispose();
  });

  test('stops the previous song before starting the next', () async {
    final r = reporter();
    r.observe(songId: 'a', playing: true, position: Duration.zero);
    await settle();
    clock = clock.add(const Duration(seconds: 200));
    r.observe(songId: 'b', playing: true, position: Duration.zero);
    await settle();
    expect(sent, ['a starting 0', 'a stopped 200', 'b starting 0']);
    r.dispose();
  });

  test('reports regularly while playing', () async {
    final r = reporter();
    var position = Duration.zero;
    r.observe(
      songId: 'a',
      playing: true,
      position: position,
      currentPosition: () => position,
    );
    await settle();
    position = const Duration(seconds: 15);
    r.tick();
    expect(sent, ['a starting 0', 'a playing 15']);
    r.dispose();
  });

  test('asks the server only once the song plays', () async {
    var asked = 0;
    final r = PlaybackReporter(
      send: (id, state, position) async => sent.add('$id $state'),
      supported: () async {
        asked++;
        return true;
      },
      now: () => clock,
    );
    r.observe(songId: 'a', playing: false, position: Duration.zero);
    await settle();
    expect(asked, 0);
    r.observe(songId: 'a', playing: true, position: Duration.zero);
    await settle();
    expect(asked, 1);
    expect(sent, ['a starting']);
    r.dispose();
  });

  test('sends nothing to a server without reports', () async {
    supported = false;
    final r = reporter();
    r.observe(songId: 'a', playing: true, position: Duration.zero);
    await settle();
    r.observe(songId: 'a', playing: false, position: Duration.zero);
    r.tick();
    r.observe(songId: 'b', playing: true, position: Duration.zero);
    await settle();
    expect(sent, isEmpty);
    r.dispose();
  });

  test('a phone file stops the reports of the server song', () async {
    final r = reporter();
    r.observe(songId: 'a', playing: true, position: Duration.zero);
    await settle();
    clock = clock.add(const Duration(seconds: 5));
    r.observe(songId: null, playing: true, position: Duration.zero);
    r.tick();
    expect(sent, ['a starting 0', 'a stopped 5']);
    r.dispose();
  });
}
