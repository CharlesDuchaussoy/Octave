import 'package:flutter/foundation.dart';

import '../../services/subsonic_service.dart';

/// What Octo lets this account do to the songs of its own library
/// (OpenSubsonic extension "octoLibraryActions").
class LibraryActions {
  const LibraryActions({
    required this.enabled,
    required this.allowed,
    required this.actions,
    this.keepDays = 30,
  });

  final bool enabled;

  /// Only accounts on Octo's allow list may act.
  final bool allowed;

  /// "remove" (set aside, then deleted) and "upgrade" (look for a
  /// better copy).
  final List<String> actions;

  /// How long a removed file is kept before deletion.
  final int keepDays;

  bool get canRemove => enabled && allowed && actions.contains('remove');
  bool get canUpgrade => enabled && allowed && actions.contains('upgrade');

  factory LibraryActions.fromJson(Map<String, dynamic> json) =>
      LibraryActions(
        enabled: json['enabled'] == true,
        allowed: json['allowed'] == true,
        actions: [
          for (final a in (json['actions'] as List? ?? const [])) a.toString(),
        ],
        keepDays: (json['keepDays'] as num?)?.toInt() ?? 30,
      );

  /// Answer used by widget tests instead of asking a server.
  @visibleForTesting
  static LibraryActions? Function()? testAnswer;

  static LibraryActions? _cached;
  static String? _cachedFor;
  static DateTime? _cachedAt;

  /// The actions of the signed-in account, asked once every ten minutes.
  /// Null on a server without Octo's library actions. Kept per account,
  /// so switching accounts on a shared device never shows the actions of
  /// the previous one.
  static Future<LibraryActions?> of(SubsonicService subsonic) async {
    final answer = testAnswer;
    if (answer != null) return answer();
    final config = subsonic.config;
    if (config == null) return null;
    final account = '${config.serverUrl}|${config.username}';
    final at = _cachedAt;
    if (_cachedFor == account &&
        at != null &&
        DateTime.now().difference(at) < const Duration(minutes: 10)) {
      return _cached;
    }
    final actions = await subsonic.octoGetLibraryActions();
    _cached = actions;
    _cachedFor = account;
    _cachedAt = DateTime.now();
    return actions;
  }
}
