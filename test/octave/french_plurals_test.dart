import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/l10n/app_localizations.dart';

void main() {
  // French uses the singular for zero, so a count of 0 picks the "=1"
  // form: that form must say {count}, not a literal 1.
  test('French counts of zero never read 1', () {
    final fr = lookupAppLocalizations(const Locale('fr'));
    expect(fr.libraryPlaylistSubtitle(0), 'Playlist • aucun titre');
    expect(fr.libraryPlaylistSubtitle(1), 'Playlist • 1 titre');
    expect(fr.libraryPlaylistSubtitle(3), 'Playlist • 3 titres');
    expect(fr.nextUpCount(0), 'À suivre · 0 titre');
    expect(fr.playlistSongsDownloadedCount(0), '0 titre téléchargé');
    expect(fr.playsCount(0), '0 écoute');
  });

  test('no French plural writes a literal 1 without a zero form', () {
    final fr = jsonDecode(File('lib/l10n/app_fr.arb').readAsStringSync())
        as Map<String, dynamic>;
    // "hier" is only used from one day on.
    const allowed = {'agoDays'};
    final one = RegExp(r'=1\{([^{}]*)\}');
    final wrong = [
      for (final entry in fr.entries)
        if (entry.value is String &&
            !allowed.contains(entry.key) &&
            !(entry.value as String).contains('=0{') &&
            one.firstMatch(entry.value as String)?.group(1)?.contains('1') ==
                true)
          entry.key,
    ];
    expect(wrong, isEmpty);
  });
}
