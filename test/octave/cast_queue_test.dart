import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/cast/cast_queue.dart';

void main() {
  List<int> plan({
    int length = 6,
    int current = 2,
    bool repeatAll = false,
    bool repeatOne = false,
    bool Function(int)? canCast,
    int max = castQueueWindow,
  }) =>
      castUpcoming(
        queueLength: length,
        currentIndex: current,
        repeatAll: repeatAll,
        repeatOne: repeatOne,
        canCast: canCast,
        max: max,
      );

  test('sends the following songs in order', () {
    expect(plan(), [3, 4, 5]);
  });

  test('wraps around with repeat all', () {
    expect(plan(repeatAll: true), [3, 4, 5, 0, 1]);
  });

  test('sends nothing with repeat one', () {
    expect(plan(repeatOne: true), isEmpty);
  });

  test('stops at the window size', () {
    expect(plan(current: 0, max: 2), [1, 2]);
    expect(plan(length: 100, current: 10), hasLength(castQueueWindow));
  });

  test('skips songs a speaker cannot fetch', () {
    expect(plan(canCast: (i) => i != 4), [3, 5]);
  });

  test('sends nothing for the last song, or a lost index', () {
    expect(plan(current: 5), isEmpty);
    expect(plan(length: 0, current: -1), isEmpty);
    expect(plan(current: 9), isEmpty);
  });
}
