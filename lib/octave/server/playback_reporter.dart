import 'dart:async';

/// Sends a playback report to the server.
typedef PlaybackReportSender = Future<void> Function(
  String songId,
  String state,
  Duration position,
);

/// Tells the server what Octave plays, through the OpenSubsonic
/// "playbackReport" extension (rest/reportPlayback).
///
/// Navidrome shows the song as playing now, and Octo counts the play once
/// a third is heard. A report goes out when a song starts ("starting",
/// near position 0, which also lets Octo count a replay), pauses,
/// resumes, jumps (seek), stops, and every [interval] while it plays.
///
/// Reports never scrobble by themselves (ignoreScrobble=true, set by the
/// sender): Octave keeps scrobbling at the end of a song, and Octo keeps a
/// single play out of both (checked with the server session, 27/10).
class PlaybackReporter {
  PlaybackReporter({
    required this.send,
    required this.supported,
    this.interval = const Duration(seconds: 15),
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  final PlaybackReportSender send;

  /// Whether the server takes reports; asked when a song starts.
  final Future<bool> Function() supported;

  final Duration interval;
  final DateTime Function() _now;

  String? _songId;
  String? _state;

  /// Whether the server was asked about reports for this song, and its
  /// answer. It is asked once the song really plays.
  bool _checked = false;
  bool _enabled = false;
  bool _playing = false;
  Duration _position = Duration.zero;
  DateTime _at = DateTime.fromMillisecondsSinceEpoch(0);
  Timer? _timer;
  Duration Function()? _currentPosition;

  /// A jump in position bigger than this, between two observations, is a
  /// seek.
  static const _seekThreshold = Duration(seconds: 4);

  /// Follows the player: [songId] is the song playing (null when nothing,
  /// or a song the server does not know, such as a file of the phone),
  /// [playing] whether it plays, [position] where it is.
  /// [currentPosition] reads the position at each periodic report.
  void observe({
    required String? songId,
    required bool playing,
    required Duration position,
    Duration Function()? currentPosition,
  }) {
    _currentPosition = currentPosition;
    _playing = playing;
    if (songId != _songId) {
      _switchTo(songId, playing, position);
      return;
    }
    if (songId == null) return;
    if (!_checked) {
      if (playing) _check(songId, position);
      return;
    }
    if (!_enabled) return;

    final wasPlaying = _state == 'starting' || _state == 'playing';
    if (playing != wasPlaying) {
      _report(playing ? 'playing' : 'paused', position);
    } else if ((position - _expected()).abs() > _seekThreshold) {
      _report(playing ? 'playing' : 'paused', position);
    }
    _syncTimer(playing);
  }

  void _switchTo(String? songId, bool playing, Duration position) {
    final previous = _songId;
    if (previous != null && _enabled && _state != 'stopped') {
      send(previous, 'stopped', _expected()).catchError((_) {});
    }
    _songId = songId;
    _state = null;
    _checked = false;
    _enabled = false;
    _timer?.cancel();
    _timer = null;
    if (songId != null && playing) _check(songId, position);
  }

  void _check(String songId, Duration position) {
    _checked = true;
    supported().then((ok) {
      // Another song may have started meanwhile.
      if (_songId != songId) return;
      _enabled = ok;
      if (!ok) return;
      _report(_playing ? 'starting' : 'paused',
          _currentPosition?.call() ?? position);
      _syncTimer(_playing);
    }).catchError((_) {});
  }

  /// Where the song should be now, from the last report.
  Duration _expected() {
    if (_state != 'starting' && _state != 'playing') return _position;
    return _position + _now().difference(_at);
  }

  void _report(String state, Duration position) {
    final songId = _songId;
    if (songId == null) return;
    _state = state;
    _position = position;
    _at = _now();
    send(songId, state, position).catchError((_) {});
  }

  void _syncTimer(bool playing) {
    if (!playing) {
      _timer?.cancel();
      _timer = null;
      return;
    }
    _timer ??= Timer.periodic(interval, (_) => tick());
  }

  /// Periodic report while the song plays; public for tests.
  void tick() {
    if (_songId == null || !_enabled) return;
    if (_state != 'starting' && _state != 'playing') return;
    _report('playing', _currentPosition?.call() ?? _expected());
  }

  void dispose() {
    final songId = _songId;
    if (songId != null && _enabled && _state != 'stopped') {
      send(songId, 'stopped', _expected()).catchError((_) {});
    }
    _timer?.cancel();
    _timer = null;
    _songId = null;
  }
}
