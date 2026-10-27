import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/models/song.dart';
import 'package:musly/models/server_config.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/providers/library_provider.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/services/storage_service.dart';
import 'package:musly/services/upnp_service.dart';
import 'package:musly/services/audio_handler.dart';
import 'package:musly/services/jukebox_service.dart';
import 'package:musly/services/transcoding_service.dart';
import 'package:musly/widgets/navigation/desktop_player_bar.dart';
import 'package:musly/widgets/modals/song_options_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../test_helpers.dart';
import '../bootstrap.dart';
import 'package:musly/octave/server/library_actions.dart';

void main() {
  initializeTestEnvironment();

  group('DesktopPlayerBar Actions Tests', () {
    late SubsonicService subsonicService;
    late PlayerProvider playerProvider;
    late LibraryProvider libraryProvider;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      // The song menu asks the server for Octo's library actions.
      LibraryActions.testAnswer = () => null;
      addTearDown(() => LibraryActions.testAnswer = null);
      subsonicService = SubsonicService();
      await subsonicService.configure(ServerConfig(
        serverUrl: 'https://demo.navidrome.org',
        username: 'user',
        password: 'password',
      ));
      final storageService = StorageService();
      playerProvider = PlayerProvider(
        subsonicService,
        storageService,
        FakeCastService(),
        UpnpService(),
        MuslyAudioHandler(),
        JukeboxService(),
        TranscodingService(),
      );
      libraryProvider = LibraryProvider(
        subsonicService,
        MuslyAudioHandler(),
      );
    });

    tearDownAll(() {
      TestWidgetsFlutterBinding.instance.platformDispatcher.views.first
          .resetPhysicalSize();
      TestWidgetsFlutterBinding.instance.platformDispatcher.views.first
          .resetDevicePixelRatio();
    });

    for (final allowed in [true, false]) {
      testWidgets(
          'song menu ${allowed ? 'offers' : 'hides'} library actions when '
          'the account ${allowed ? 'may' : 'may not'} act', (tester) async {
        tester.view.physicalSize = const Size(1280, 900);
        tester.view.devicePixelRatio = 1.0;
        LibraryActions.testAnswer = () => LibraryActions(
              enabled: true,
              allowed: allowed,
              actions: const ['remove', 'upgrade'],
            );

        libraryProvider.setServerOfflineMode(true);
        playerProvider.playSong(Song(
          id: 'test_song_2',
          title: 'Another Song',
          artist: 'Test Artist',
          duration: 180,
        ));
        await tester.pumpWidget(
          createTestApp(
            playerProvider: playerProvider,
            libraryProvider: libraryProvider,
            subsonicService: subsonicService,
            child: const SizedBox(height: 90, child: DesktopPlayerBar()),
          ),
        );
        await tester.pump(const Duration(seconds: 1));
        await tester.tap(find.byIcon(Icons.more_horiz));
        await tester.pumpAndSettle();

        final matcher = allowed ? findsOneWidget : findsNothing;
        expect(find.text('Remove from my library'), matcher);
        expect(find.text('Look for a better quality'), matcher);

        Navigator.pop(tester.element(find.byType(SongOptionsModal)));
        await tester.pumpAndSettle();
      });
    }

    testWidgets(
        'renders favorite, add to playlist, and more options buttons for current song',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 800);
      tester.view.devicePixelRatio = 1.0;

      final song = Song(
        id: 'test_song_1',
        title: 'Test Song Title',
        artist: 'Test Artist',
        duration: 210,
      );

      libraryProvider.setServerOfflineMode(true);
      playerProvider.playSong(song);

      await tester.pumpWidget(
        createTestApp(
          playerProvider: playerProvider,
          libraryProvider: libraryProvider,
          subsonicService: subsonicService,
          child: const SizedBox(
            height: 90,
            child: DesktopPlayerBar(),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(DesktopPlayerBar), findsOneWidget);
      expect(find.text('Test Song Title'), findsOneWidget);
      expect(find.text('Test Artist'), findsOneWidget);

      expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
      expect(find.byIcon(Icons.playlist_add_rounded), findsOneWidget);
      expect(find.byIcon(Icons.more_horiz), findsOneWidget);

      await tester.tap(find.byIcon(Icons.more_horiz));
      await tester.pumpAndSettle();

      expect(find.byType(SongOptionsModal), findsOneWidget);
      expect(find.text('Add to Playlist'), findsOneWidget);

      Navigator.pop(tester.element(find.byType(SongOptionsModal)));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.playlist_add_rounded));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Add to Playlist'), findsWidgets);
    });
  });
}
