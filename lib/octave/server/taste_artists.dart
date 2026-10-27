import '../../models/artist.dart';

/// Artists to pick in the guided setup, from Octo (OpenSubsonic extension
/// "octoTasteArtists"): the account's most played, the France and world
/// charts of the moment, and the artists picked last time.
class TasteArtists {
  const TasteArtists({
    this.mine = const [],
    this.france = const [],
    this.world = const [],
    this.chosen = const [],
  });

  final List<Artist> mine;
  final List<Artist> france;
  final List<Artist> world;
  final List<Artist> chosen;

  static const empty = TasteArtists();

  factory TasteArtists.fromJson(Map<String, dynamic> json) {
    List<Artist> list(String key) {
      var raw = json[key];
      if (raw is Map) raw = raw['artist'];
      if (raw is Map) raw = [raw];
      if (raw is! List) return const [];
      return [
        for (final a in raw)
          if (a is Map<String, dynamic> && (a['id']?.toString() ?? '') != '')
            Artist.fromJson(a),
      ];
    }

    return TasteArtists(
      mine: list('mine'),
      france: list('france'),
      world: list('world'),
      chosen: list('chosen'),
    );
  }
}
