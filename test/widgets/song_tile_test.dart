import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:musly/models/song.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/services/storage_service.dart';
import 'package:musly/services/upnp_service.dart';
import 'package:musly/services/audio_handler.dart';
import 'package:musly/services/jukebox_service.dart';
import 'package:musly/services/transcoding_service.dart';
import 'package:musly/widgets/common/song_tile.dart';
import 'package:musly/widgets/common/album_artwork.dart';
import 'package:musly/widgets/common/animated_equalizer.dart';
import '../test_helpers.dart';
import '../bootstrap.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  initializeTestEnvironment();
  group('SongTile', () {
    late SubsonicService subsonicService;
    late PlayerProvider playerProvider;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      subsonicService = SubsonicService();
      playerProvider = PlayerProvider(
        subsonicService,
        StorageService(),
        FakeCastService(),
        UpnpService(),
        MuslyAudioHandler(),
        JukeboxService(),
        TranscodingService(),
      );
    });

    tearDown(() {
      playerProvider.dispose();
    });

    testWidgets('should display song information', (tester) async {
      final song = Song(
        id: '1',
        title: 'Test Song',
        artist: 'Test Artist',
        album: 'Test Album',
        duration: 180,
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<SubsonicService>.value(value: subsonicService),
            ChangeNotifierProvider<PlayerProvider>.value(value: playerProvider),
          ],
          child: MaterialApp(
            home: Scaffold(body: SongTile(song: song, showArtist: true)),
          ),
        ),
      );

      expect(find.text('Test Song'), findsOneWidget);
      expect(find.text('Test Artist'), findsOneWidget);
    });

    testWidgets('marks a song from outside the library with a globe',
        (tester) async {
      // The test app owns its player and the texts the badge reads.
      Widget tile(Song song) => createTestApp(
            subsonicService: subsonicService,
            child: SongTile(song: song, showArtist: true),
          );

      await tester.pumpWidget(tile(Song(
        id: 'x',
        title: 'Dancing Queen',
        artist: 'ABBA',
        isExternal: true,
      )));
      expect(find.byIcon(CupertinoIcons.globe), findsOneWidget);
      expect(find.text('ABBA'), findsOneWidget);

      await tester.pumpWidget(
          tile(Song(id: 'y', title: 'Super Trouper', artist: 'ABBA')));
      expect(find.byIcon(CupertinoIcons.globe), findsNothing);
    });

    testWidgets('should show duration when enabled', (tester) async {
      final song = Song(
        id: '1',
        title: 'Test Song',
        artist: 'Test Artist',
        duration: 180,
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<SubsonicService>.value(value: subsonicService),
            ChangeNotifierProvider<PlayerProvider>.value(value: playerProvider),
          ],
          child: MaterialApp(
            home: Scaffold(body: SongTile(song: song, showDuration: true)),
          ),
        ),
      );

      expect(find.text('3:00'), findsOneWidget);
    });

    testWidgets('should show album when enabled', (tester) async {
      final song = Song(
        id: '1',
        title: 'Test Song',
        artist: 'Test Artist',
        album: 'Test Album',
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<SubsonicService>.value(value: subsonicService),
            ChangeNotifierProvider<PlayerProvider>.value(value: playerProvider),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: SongTile(song: song, showArtist: true, showAlbum: true),
            ),
          ),
        ),
      );

      expect(find.textContaining('Test Artist'), findsOneWidget);
      expect(find.textContaining('Test Album'), findsOneWidget);
    });

    testWidgets('should show AlbumArtwork with centered AnimatedEqualizer overlay when playing with showArtwork', (tester) async {
      final song = Song(
        id: '1',
        title: 'Playing Song',
        artist: 'Test Artist',
        album: 'Test Album',
        coverArt: 'cover_1',
      );

      // Set song as current playing song
      playerProvider.playSong(song, playlist: [song], startIndex: 0);

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<SubsonicService>.value(value: subsonicService),
            ChangeNotifierProvider<PlayerProvider>.value(value: playerProvider),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: SongTile(song: song, showArtwork: true),
            ),
          ),
        ),
      );

      // Flush internal timers from playSong
      await tester.pump(const Duration(seconds: 2));

      expect(find.byType(AlbumArtwork), findsOneWidget);
      expect(find.byType(AnimatedEqualizer), findsOneWidget);
      expect(find.byType(Stack), findsWidgets);
    });

    testWidgets('AnimatedEqualizer maintains stable height of 16.0 during animation', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AnimatedEqualizer(
                color: Colors.white,
                isPlaying: true,
              ),
            ),
          ),
        ),
      );

      final initialSize = tester.getSize(find.byType(AnimatedEqualizer));
      expect(initialSize.height, 16.0);

      // Advance frames to let animations progress
      await tester.pump(const Duration(milliseconds: 150));
      final sizeMidway = tester.getSize(find.byType(AnimatedEqualizer));
      expect(sizeMidway.height, 16.0);

      await tester.pump(const Duration(milliseconds: 200));
      final sizeLater = tester.getSize(find.byType(AnimatedEqualizer));
      expect(sizeLater.height, 16.0);
    });
  });
}
