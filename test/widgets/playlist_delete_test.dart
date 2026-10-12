import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/models/playlist.dart';
import 'package:musly/models/song.dart';
import 'package:musly/widgets/modals/playlist_options_modal.dart';
import 'package:musly/screens/detail/playlist_screen.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/services/audio_handler.dart';
import 'package:musly/providers/library_provider.dart';
import '../test_helpers.dart';
import '../bootstrap.dart';

class FakePlaylistSubsonicService extends SubsonicService {
  @override
  Future<Playlist> getPlaylist(String id) async {
    return Playlist(
      id: id,
      name: 'My Cool Playlist',
      songs: [
        Song(id: 's1', title: 'Song 1', artist: 'Artist 1'),
      ],
    );
  }
}

class TestPlaylistLibraryProvider extends LibraryProvider {
  final List<Playlist> _testPlaylists;

  TestPlaylistLibraryProvider({
    required SubsonicService subsonicService,
    required MuslyAudioHandler audioHandler,
    required List<Playlist> testPlaylists,
  })  : _testPlaylists = testPlaylists,
        super(subsonicService, audioHandler);

  @override
  List<Playlist> get playlists => _testPlaylists;
}

void main() {
  initializeTestEnvironment();

  group('Playlist Deletion Tests', () {
    testWidgets('PlaylistOptionsModal displays playlist info and delete option', (
      WidgetTester tester,
    ) async {
      final testPlaylist = Playlist(
        id: 'pl-1',
        name: 'My Cool Playlist',
        songCount: 5,
      );

      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) => Scaffold(
              body: ElevatedButton(
                onPressed: () =>
                    PlaylistOptionsModal.show(context, testPlaylist),
                child: const Text('Open Options'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Options'));
      await tester.pumpAndSettle();

      expect(find.text('My Cool Playlist'), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.trash), findsOneWidget);
    });

    testWidgets('PlaylistScreen contains delete playlist menu item', (
      WidgetTester tester,
    ) async {
      final fakeSubsonic = FakePlaylistSubsonicService();
      final testPlaylist = Playlist(
        id: 'pl-1',
        name: 'My Cool Playlist',
        songs: [
          Song(id: 's1', title: 'Song 1', artist: 'Artist 1'),
        ],
      );
      final testLibraryProvider = TestPlaylistLibraryProvider(
        subsonicService: fakeSubsonic,
        audioHandler: MuslyAudioHandler(),
        testPlaylists: [testPlaylist],
      );

      await tester.pumpWidget(
        createTestApp(
          subsonicService: fakeSubsonic,
          libraryProvider: testLibraryProvider,
          child: const PlaylistScreen(
            playlistId: 'pl-1',
            playlistName: 'My Cool Playlist',
          ),
        ),
      );
      await tester.pumpAndSettle();

      final popupMenu = find.byType(PopupMenuButton<String>);
      expect(popupMenu, findsOneWidget);

      await tester.tap(popupMenu);
      await tester.pumpAndSettle();

      expect(find.byIcon(CupertinoIcons.trash), findsOneWidget);
    });
  });
}
