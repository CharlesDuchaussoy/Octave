import 'dart:collection';

import 'package:flutter/foundation.dart';

/// The last lines the app wrote to its log, kept in memory so a problem
/// report can include them. Nothing is written to disk.
class AppLog {
  AppLog._();

  static const _maxLines = 400;
  static final _lines = ListQueue<String>();

  /// Copies everything [debugPrint] writes, from now on.
  static void install() {
    final original = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) add(message);
      original(message, wrapWidth: wrapWidth);
    };
  }

  static void add(String message) {
    final time = DateTime.now().toUtc().toIso8601String().substring(11, 23);
    _lines.add('$time $message');
    while (_lines.length > _maxLines) {
      _lines.removeFirst();
    }
  }

  static List<String> get lines => List.unmodifiable(_lines);

  @visibleForTesting
  static void clear() => _lines.clear();
}
