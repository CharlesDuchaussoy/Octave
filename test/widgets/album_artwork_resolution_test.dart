import 'package:flutter_test/flutter_test.dart';
import 'package:musly/models/server_config.dart';
import 'package:musly/services/player_ui_settings_service.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/widgets/common/album_artwork.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    ImageUrlCache.clear();
  });

  group('AlbumArtwork Resolution and Caching', () {
    test('ImageUrlCache caches URLs by size and clears successfully', () async {
      final service = SubsonicService();
      await service.configure(ServerConfig(
        serverUrl: 'https://demo.navidrome.org',
        username: 'user',
        password: 'password',
      ));

      final url600 = ImageUrlCache.getUrl(service, 'al-1', 600);
      expect(url600, contains('size=600'));
      expect(url600, contains('id=al-1'));

      final url300 = ImageUrlCache.getUrl(service, 'al-1', 300);
      expect(url300, contains('size=300'));
      expect(url300, isNot(equals(url600)));

      ImageUrlCache.clear();
      final urlAfterClear = ImageUrlCache.getUrl(service, 'al-1', 600);
      expect(urlAfterClear, contains('size=600'));
    });

    testWidgets('AlbumArtwork builds without exception in normal, low, and high resolution',
        (tester) async {
      final settings = PlayerUiSettingsService();
      await settings.setArtworkResolution('normal');

      await tester.pumpWidget(
        createTestApp(
          child: const AlbumArtwork(
            coverArt: 'cover_test_1',
            size: 156,
          ),
        ),
      );

      expect(find.byType(AlbumArtwork), findsOneWidget);

      await settings.setArtworkResolution('low');
      await tester.pumpAndSettle();
      expect(find.byType(AlbumArtwork), findsOneWidget);

      await settings.setArtworkResolution('high');
      await tester.pumpAndSettle();
      expect(find.byType(AlbumArtwork), findsOneWidget);
    });

    test('SubsonicService getCoverArtUrl defaults to 600px', () async {
      final service = SubsonicService();
      await service.configure(ServerConfig(
        serverUrl: 'https://demo.navidrome.org',
        username: 'user',
        password: 'password',
      ));

      final defaultUrl = service.getCoverArtUrl('al-cover');
      expect(defaultUrl, contains('size=600'));
    });
  });
}
