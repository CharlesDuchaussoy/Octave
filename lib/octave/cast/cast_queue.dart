/// How many songs Octave hands a Cast speaker ahead of the current one.
///
/// The speaker plays them by itself, so the music goes on when the phone
/// sleeps or Octave is closed. While Octave runs, it tops the list up as
/// the speaker moves on.
const int castQueueWindow = 20;

/// Queue indexes of the songs to send after the current one, in the order
/// the speaker should play them: the following songs, then the first ones
/// with [repeatAll]. None with [repeatOne], since the speaker repeats the
/// current song itself. Shuffle needs nothing here: Octave shuffles the
/// queue itself.
///
/// [canCast] leaves out songs a speaker cannot fetch, such as the files of
/// the phone.
List<int> castUpcoming({
  required int queueLength,
  required int currentIndex,
  required bool repeatAll,
  required bool repeatOne,
  bool Function(int index)? canCast,
  int max = castQueueWindow,
}) {
  if (repeatOne || currentIndex < 0 || currentIndex >= queueLength) {
    return const [];
  }
  bool eligible(int i) => canCast?.call(i) ?? true;

  final result = <int>[];
  for (var i = currentIndex + 1; i < queueLength && result.length < max; i++) {
    if (eligible(i)) result.add(i);
  }
  if (repeatAll) {
    for (var i = 0; i < currentIndex && result.length < max; i++) {
      if (eligible(i)) result.add(i);
    }
  }
  return result;
}
