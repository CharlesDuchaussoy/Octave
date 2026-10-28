import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'cover_design.dart';

/// Custom playlist covers made in the editor.
///
/// For each playlist, the folder keeps the rendered image
/// (`<id>_<time>.png`, a new name on each save so image caches never show
/// an old version), the design (`<id>.json`) to reopen it in the editor,
/// and the photo it uses, if any (`<id>_photo_<time>.<ext>`).
///
/// Covers stay on this device for now. Sharing them with the other apps
/// of the server needs the `octo.setPlaylistImage` command in Octo.
class PlaylistCoverStore {
  PlaylistCoverStore._();
  static final PlaylistCoverStore instance = PlaylistCoverStore._();

  /// Bumped after each save or removal, so covers on screen refresh.
  final ValueNotifier<int> updates = ValueNotifier<int>(0);

  final Map<String, String> _images = {};
  Directory? _dir;

  Future<Directory> _folder() async {
    if (_dir != null) return _dir!;
    final support = await getApplicationSupportDirectory();
    final dir = Directory(p.join(support.path, 'octave_playlist_covers'));
    if (!await dir.exists()) await dir.create(recursive: true);
    return _dir = dir;
  }

  /// Lists the saved covers. Call once at startup.
  Future<void> init() async {
    try {
      final dir = await _folder();
      final pngs = dir
          .listSync()
          .whereType<File>()
          .where((f) =>
              f.path.endsWith('.png') &&
              !p.basename(f.path).contains('_photo_'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));
      for (final file in pngs) {
        final name = p.basenameWithoutExtension(file.path);
        final cut = name.lastIndexOf('_');
        if (cut > 0) _images[name.substring(0, cut)] = file.path;
      }
      if (pngs.isNotEmpty) updates.value++;
    } catch (e) {
      debugPrint('[PlaylistCoverStore] init failed: $e');
    }
  }

  /// Rendered cover of [playlistId], if the user made one.
  String? imagePath(String playlistId) => _images[playlistId];

  /// Design of the cover of [playlistId], to reopen it in the editor.
  Future<CoverDesign?> design(String playlistId) async {
    try {
      final file = File(p.join((await _folder()).path, '$playlistId.json'));
      if (!await file.exists()) return null;
      return CoverDesign.fromJson(
          jsonDecode(await file.readAsString()) as Map<String, dynamic>);
    } catch (e) {
      debugPrint('[PlaylistCoverStore] cannot read design: $e');
      return null;
    }
  }

  /// Saves the rendered [png] and its [design]. A photo outside the
  /// folder is copied in, so the design keeps working if the original
  /// is deleted.
  Future<void> save(
      String playlistId, CoverDesign design, Uint8List png) async {
    final dir = await _folder();
    var saved = design;
    final photo = design.imagePath;
    if (photo != null && p.dirname(photo) != dir.path) {
      final stamp = DateTime.now().millisecondsSinceEpoch;
      final copy =
          p.join(dir.path, '${playlistId}_photo_$stamp${p.extension(photo)}');
      await File(photo).copy(copy);
      saved = design.copyWith(imagePath: copy);
    }
    // Photos of earlier versions are no longer used.
    for (final file in dir.listSync().whereType<File>()) {
      final name = p.basename(file.path);
      if (name.startsWith('${playlistId}_photo_') &&
          file.path != saved.imagePath) {
        await _delete(file.path);
      }
    }

    final image = p.join(
        dir.path, '${playlistId}_${DateTime.now().millisecondsSinceEpoch}.png');
    await File(image).writeAsBytes(png, flush: true);
    await File(p.join(dir.path, '$playlistId.json'))
        .writeAsString(jsonEncode(saved.toJson()));

    final previous = _images[playlistId];
    _images[playlistId] = image;
    if (previous != null && previous != image) {
      await _delete(previous);
    }
    updates.value++;
  }

  /// Goes back to the automatic cover of [playlistId].
  Future<void> remove(String playlistId) async {
    // Nothing on disk for playlists without a custom cover.
    if (_images.remove(playlistId) == null) return;
    final dir = await _folder();
    for (final file in dir.listSync().whereType<File>()) {
      final name = p.basename(file.path);
      if (name == '$playlistId.json' || name.startsWith('${playlistId}_')) {
        await _delete(file.path);
      }
    }
    updates.value++;
  }

  static Future<void> _delete(String path) async {
    try {
      await File(path).delete();
    } catch (_) {}
  }
}
