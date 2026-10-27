import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/song.dart';
import '../../services/subsonic_service.dart';

/// The play queue as the server keeps it (OpenSubsonic "indexBasedQueue").
class ServerQueue {
  const ServerQueue({
    required this.songs,
    required this.currentIndex,
    required this.position,
    required this.changed,
    required this.changedBy,
  });

  final List<Song> songs;
  final int currentIndex;
  final Duration position;

  /// When it was saved, and by which app ("Octave", "Arpeggi"...).
  final DateTime changed;
  final String changedBy;

  Song get current => songs[currentIndex];

  /// Null when the server keeps no queue for the account.
  static ServerQueue? fromJson(Map<String, dynamic> json) {
    var entries = json['entry'];
    if (entries == null) return null;
    if (entries is! List) entries = [entries];
    final songs = [
      for (final e in entries) Song.fromJson(e as Map<String, dynamic>),
    ];
    if (songs.isEmpty) return null;
    final index = (json['currentIndex'] as num?)?.toInt() ?? 0;
    return ServerQueue(
      songs: songs,
      currentIndex: index.clamp(0, songs.length - 1),
      position:
          Duration(milliseconds: (json['position'] as num?)?.toInt() ?? 0),
      changed: DateTime.tryParse(json['changed']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      changedBy: json['changedBy']?.toString() ?? '',
    );
  }
}

/// What to save of [queue]: only songs of the server library resolve
/// there, so phone files and songs Octo streams from outside the library
/// are left out, and the current index follows. When the current song is
/// left out, the next kept one becomes current (else the previous one).
/// Null when nothing can be saved.
({List<String> ids, int index})? serverQueuePlan(
    List<Song> queue, int currentIndex) {
  bool kept(Song s) => !s.isLocal && !s.isExternal;
  final ids = <String>[];
  int? index;
  for (var i = 0; i < queue.length; i++) {
    if (!kept(queue[i])) continue;
    if (i >= currentIndex && index == null) index = ids.length;
    ids.add(queue[i].id);
  }
  if (ids.isEmpty) return null;
  return (ids: ids, index: index ?? ids.length - 1);
}

/// Picking up the queue on another device: Octave saves its queue on the
/// server, and offers to resume a queue that another device or app left
/// there more recently.
///
/// The server keeps one queue per account, shared by all its apps: the
/// last one to save wins (agreed with Charles, 27/10).
class QueueHandoff {
  QueueHandoff._();
  static final QueueHandoff instance = QueueHandoff._();

  /// A queue left by another device or app, offered on the home screen.
  final ValueNotifier<ServerQueue?> offer = ValueNotifier(null);

  static const _savedAtKey = 'octave_queue_saved_at';
  static const _dismissedKey = 'octave_queue_dismissed';

  /// A save within this margin of the server's time counts as ours, to
  /// absorb small clock differences between the phone and the server.
  static const _ownSaveMargin = Duration(seconds: 90);

  Timer? _debounce;
  String? _lastSaved;

  Future<bool> _supported(SubsonicService subsonic) async =>
      (await subsonic.openSubsonicExtensions()).contains('indexBasedQueue');

  /// Saves the queue a few seconds after it settles, so skipping through
  /// songs makes one request.
  void scheduleSave(
    SubsonicService subsonic,
    List<Song> queue,
    int currentIndex,
    Duration position,
  ) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 5), () {
      save(subsonic, queue, currentIndex, position)
          .catchError((e) => debugPrint('[QueueHandoff] save failed: $e'));
    });
  }

  /// Saves now: on pause and when Octave goes to the background.
  Future<void> save(
    SubsonicService subsonic,
    List<Song> queue,
    int currentIndex,
    Duration position,
  ) async {
    _debounce?.cancel();
    final plan = serverQueuePlan(queue, currentIndex);
    if (plan == null || !subsonic.isConfigured) return;
    // Same queue, same song, about the same place: nothing new to say.
    final signature =
        '${plan.ids.join(',')}|${plan.index}|${position.inSeconds ~/ 10}';
    if (signature == _lastSaved) return;
    if (!await _supported(subsonic)) return;
    await subsonic.savePlayQueueByIndex(plan.ids, plan.index, position);
    _lastSaved = signature;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_savedAtKey, DateTime.now().millisecondsSinceEpoch);
  }

  /// Looks for a queue to offer: one saved on the server after Octave's
  /// own last save on this device, that the user did not dismiss, and not
  /// on the song already playing here.
  Future<void> checkOffer(SubsonicService subsonic, {Song? playing}) async {
    try {
      if (!subsonic.isConfigured || !await _supported(subsonic)) return;
      final queue = await subsonic.getPlayQueueByIndex();
      if (queue == null) {
        offer.value = null;
        return;
      }
      final prefs = await SharedPreferences.getInstance();
      final savedAt = prefs.getInt(_savedAtKey);
      final ours = savedAt != null &&
          !queue.changed.isAfter(
              DateTime.fromMillisecondsSinceEpoch(savedAt).add(_ownSaveMargin));
      final dismissed =
          prefs.getString(_dismissedKey) == queue.changed.toIso8601String();
      final alreadyHere = playing?.id == queue.current.id;
      offer.value = ours || dismissed || alreadyHere ? null : queue;
    } catch (e) {
      debugPrint('[QueueHandoff] no queue to offer: $e');
    }
  }

  /// The user does not want this queue: it is not offered again.
  Future<void> dismiss() async {
    final queue = offer.value;
    offer.value = null;
    if (queue == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dismissedKey, queue.changed.toIso8601String());
  }

  /// The offer was taken: it goes away.
  void taken() => offer.value = null;
}
