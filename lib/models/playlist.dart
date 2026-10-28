import 'song.dart';

class Playlist {
  final String id;
  final String name;
  final String? comment;
  final String? owner;
  final bool? public;
  final int? songCount;
  final int? duration;
  final DateTime? created;
  final DateTime? changed;
  final String? coverArt;
  final List<Song>? songs;

  /// Set by the server (OpenSubsonic) on playlists the user cannot edit:
  /// smart playlists of Navidrome, mixes and radios made by Octo.
  final bool? readonly;

  /// Until when an automatic playlist stays as it is before the server
  /// refreshes it (OpenSubsonic).
  final DateTime? validUntil;

  /// Made by the server rather than by someone: Octo's mixes and radios,
  /// Navidrome's smart playlists.
  bool get isAutomatic => readonly == true || validUntil != null;

  /// A mix or radio that Octo makes for this account from its tastes:
  /// read-only, with a 22-character id starting with "og" (mixes) or
  /// "or" (radios). Navidrome's own read-only lists (recent additions,
  /// most played...) do not match.
  bool get isOctoMix =>
      readonly == true &&
      id.length == 22 &&
      (id.startsWith('og') || id.startsWith('or'));

  Playlist({
    required this.id,
    required this.name,
    this.comment,
    this.owner,
    this.public,
    this.songCount,
    this.duration,
    this.created,
    this.changed,
    this.coverArt,
    this.songs,
    this.readonly,
    this.validUntil,
  });

  Playlist copyWith({
    String? id,
    String? name,
    String? comment,
    String? owner,
    bool? public,
    int? songCount,
    int? duration,
    DateTime? created,
    DateTime? changed,
    String? coverArt,
    List<Song>? songs,
    bool? readonly,
    DateTime? validUntil,
  }) {
    return Playlist(
      id: id ?? this.id,
      name: name ?? this.name,
      comment: comment ?? this.comment,
      owner: owner ?? this.owner,
      public: public ?? this.public,
      songCount: songCount ?? this.songCount,
      duration: duration ?? this.duration,
      created: created ?? this.created,
      changed: changed ?? this.changed,
      coverArt: coverArt ?? this.coverArt,
      songs: songs ?? this.songs,
      readonly: readonly ?? this.readonly,
      validUntil: validUntil ?? this.validUntil,
    );
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    List<Song>? songsList;
    if (json['entry'] != null) {
      songsList = (json['entry'] as List)
          .map((entry) => Song.fromJson(entry as Map<String, dynamic>))
          .toList();
    }

    return Playlist(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? 'Unknown Playlist',
      comment: json['comment']?.toString(),
      owner: json['owner']?.toString(),
      public: json['public'] as bool?,
      songCount: json['songCount'] as int?,
      duration: json['duration'] as int?,
      created: json['created'] != null
          ? DateTime.tryParse(json['created'].toString())
          : null,
      changed: json['changed'] != null
          ? DateTime.tryParse(json['changed'].toString())
          : null,
      coverArt: json['coverArt']?.toString(),
      songs: songsList,
      readonly: _bool(json['readonly']),
      validUntil: json['validUntil'] != null
          ? DateTime.tryParse(json['validUntil'].toString())
          : null,
    );
  }

  static bool? _bool(Object? value) => switch (value) {
        bool b => b,
        String s => s.toLowerCase() == 'true',
        _ => null,
      };

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'comment': comment,
      'owner': owner,
      'public': public,
      'songCount': songCount,
      'duration': duration,
      'created': created?.toIso8601String(),
      'changed': changed?.toIso8601String(),
      'coverArt': coverArt,
      'entry': songs?.map((song) => song.toJson()).toList(),
      'readonly': readonly,
      'validUntil': validUntil?.toIso8601String(),
    };
  }

  String get formattedDuration {
    if (duration == null) return '';
    final hours = duration! ~/ 3600;
    final minutes = (duration! % 3600) ~/ 60;
    if (hours > 0) {
      return '$hours h $minutes min';
    }
    return '$minutes min';
  }
}
