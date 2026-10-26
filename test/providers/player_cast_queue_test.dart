import 'package:flutter_chrome_cast/flutter_chrome_cast.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/models/models.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/services/audio_handler.dart';
import 'package:musly/services/jukebox_service.dart';
import 'package:musly/services/storage_service.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/services/transcoding_service.dart';
import 'package:musly/services/upnp_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bootstrap.dart';
import '../test_helpers.dart';

/// A Cast speaker gets the following songs with the current one and plays
/// them by itself, so the music goes on when the phone sleeps. Octave has
/// to follow the speaker, never the other way round.
void main() {
  initializeTestEnvironment();

  late FakeCastService cast;
  late PlayerProvider player;

  Song song(String id) => Song(
        id: id,
        title: 'Title $id',
        artist: 'Artist $id',
        coverArt: 'art-$id',
        duration: 180,
      );
  final songs = [
    for (final id in ['a', 'b', 'c', 'd']) song(id)
  ];

  Future<void> settle() =>
      Future<void>.delayed(const Duration(milliseconds: 20));

  void speakerOn(String songId, {bool playing = true}) {
    cast.setMockMediaState(cast.mediaState.copyWith(
      songId: songId,
      isPlaying: playing,
      playerState:
          playing ? CastMediaPlayerState.playing : CastMediaPlayerState.idle,
    ));
  }

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final subsonic = SubsonicService();
    await subsonic.configure(ServerConfig(
      serverUrl: 'https://music.example.org',
      username: 'test',
      password: 'secret',
    ));
    cast = FakeCastService();
    player = PlayerProvider(
      subsonic,
      StorageService(),
      cast,
      UpnpService(),
      MuslyAudioHandler(),
      JukeboxService(),
      TranscodingService(),
    );
    cast.setMockConnected(true);
    await settle();
  });

  tearDown(() => player.dispose());

  test('sends the current song and the following ones at once', () async {
    await player.playSong(songs[1], playlist: songs);

    expect(cast.loadedQueues, hasLength(1));
    expect(
        [for (final e in cast.loadedQueues.single) e.songId], ['b', 'c', 'd']);
  });

  test('follows the speaker when it moves on by itself', () async {
    await player.playSong(songs[0], playlist: songs);

    speakerOn('b');
    await settle();

    expect(player.currentSong?.id, 'b');
    expect(player.currentIndex, 1);
    // Following must not reload the speaker: that would restart the song.
    expect(cast.loadedQueues, hasLength(1));
  });

  test('ignores a song it did not send to the speaker', () async {
    await player.playSong(songs[2], playlist: songs);

    speakerOn('a');
    await settle();

    expect(player.currentSong?.id, 'c');
  });

  test('takes over when the speaker finished its last song', () async {
    await player.playSong(songs[2], playlist: songs);
    speakerOn('d');
    await settle();
    expect(cast.loadedQueues, hasLength(1));

    cast.setMockMediaState(cast.mediaState.copyWith(
      isPlaying: false,
      playerState: CastMediaPlayerState.idle,
      idleReason: GoogleCastMediaIdleReason.finished,
    ));
    await settle();

    // End of the queue with repeat off: nothing more to play.
    expect(player.currentSong?.id, 'd');
    expect(cast.loadedQueues, hasLength(1));
  });

  test('adds songs queued later to the speaker', () async {
    await player.playSong(songs[0], playlist: songs.sublist(0, 2));

    player.addToQueue(songs[2]);
    await Future<void>.delayed(const Duration(milliseconds: 900));

    expect([for (final e in cast.appended) e.songId], ['c']);
    expect(cast.loadedQueues, hasLength(1));
  });

  test('picks up a speaker still playing the queue after a reconnection',
      () async {
    await player.playSong(songs[0], playlist: songs);
    cast.setMockConnected(false);
    await settle();
    cast.loadedQueues.clear();

    // The connection was lost while the speaker went on to the third song.
    speakerOn('c');
    cast.setMockConnected(true);
    for (var i = 0; i < 100 && cast.loadedQueues.isEmpty; i++) {
      await settle();
    }

    expect(player.currentSong?.id, 'c');
    expect([for (final e in cast.loadedQueues.single) e.songId], ['c', 'd']);
  });
}
