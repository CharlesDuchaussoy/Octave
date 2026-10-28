import '../../models/song.dart';
import '../../services/subsonic_service.dart';

/// Stream sent to a Google Cast speaker (Google Home, Nest, Chromecast).
///
/// Speakers refuse a stream whose content type does not match its data,
/// and some formats outright (ALAC, FLAC above 96 kHz...). So Octave asks
/// the server for a precise format, whatever transcoding Navidrome would
/// otherwise apply to this client, and announces the matching type:
/// the original file when the speaker can play it, else MP3 at 320 kb/s.
class CastStream {
  const CastStream({
    required this.url,
    required this.contentType,
    required this.transcoded,
  });

  final String url;
  final String contentType;
  final bool transcoded;

  /// FLAC and WAV above this bit rate are almost always sampled above
  /// 96 kHz, the limit of Cast speakers.
  static const int maxLosslessBitRate = 4000;

  /// MIME type of a file Cast speakers play as is, or null.
  static String? playableType(
      {String? suffix, String? contentType, int? bitRate}) {
    final ext = suffix?.toLowerCase().trim();
    final mime = contentType?.toLowerCase().trim();
    final hiRes = bitRate != null && bitRate > maxLosslessBitRate;

    if (ext == 'mp3' || mime == 'audio/mpeg' || mime == 'audio/mp3') {
      return 'audio/mpeg';
    }
    if (ext == 'flac' || mime == 'audio/flac' || mime == 'audio/x-flac') {
      return hiRes ? null : 'audio/flac';
    }
    if (ext == 'ogg' ||
        ext == 'oga' ||
        ext == 'opus' ||
        mime == 'audio/ogg' ||
        mime == 'audio/opus') {
      return 'audio/ogg';
    }
    if (ext == 'wav' || mime == 'audio/wav' || mime == 'audio/x-wav') {
      return hiRes ? null : 'audio/wav';
    }
    if (ext == 'aac' || mime == 'audio/aac') return 'audio/aac';
    if (ext == 'webm' || mime == 'audio/webm') return 'audio/webm';
    // m4a may hold ALAC, which speakers do not play; other formats are rare.
    return null;
  }

  static CastStream forSong(Song song, SubsonicService subsonic) {
    final type = playableType(
      suffix: song.suffix,
      contentType: song.contentType,
      bitRate: song.bitRate,
    );
    if (type != null) {
      return CastStream(
        url: subsonic.getOriginalStreamUrl(song.id),
        contentType: type,
        transcoded: false,
      );
    }
    return CastStream(
      url: subsonic.getStreamUrl(song.id, format: 'mp3', maxBitRate: 320),
      contentType: 'audio/mpeg',
      transcoded: true,
    );
  }
}
