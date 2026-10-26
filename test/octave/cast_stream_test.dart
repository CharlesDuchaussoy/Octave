import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/cast/cast_stream.dart';

void main() {
  group('CastStream.playableType', () {
    test('plays common formats as they are', () {
      expect(CastStream.playableType(suffix: 'mp3'), 'audio/mpeg');
      expect(CastStream.playableType(suffix: 'flac', bitRate: 900), 'audio/flac');
      expect(CastStream.playableType(suffix: 'opus'), 'audio/ogg');
      expect(CastStream.playableType(suffix: 'ogg'), 'audio/ogg');
      expect(CastStream.playableType(contentType: 'audio/aac'), 'audio/aac');
    });

    test('announces the real type whatever the case of the suffix', () {
      expect(CastStream.playableType(suffix: 'FLAC'), 'audio/flac');
      expect(CastStream.playableType(contentType: 'audio/x-flac'), 'audio/flac');
    });

    test('transcodes hi-res lossless files, above 96 kHz', () {
      expect(CastStream.playableType(suffix: 'flac', bitRate: 5200), isNull);
      expect(CastStream.playableType(suffix: 'wav', bitRate: 9216), isNull);
    });

    test('transcodes formats speakers do not play', () {
      expect(CastStream.playableType(suffix: 'm4a'), isNull);
      expect(CastStream.playableType(suffix: 'alac'), isNull);
      expect(CastStream.playableType(suffix: 'wma'), isNull);
      expect(CastStream.playableType(suffix: 'dsf'), isNull);
      expect(CastStream.playableType(), isNull);
    });
  });
}
