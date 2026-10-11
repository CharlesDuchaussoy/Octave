import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/services/player_ui_settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bootstrap.dart';

void main() {
  initializeTestEnvironment();

  group('Favorite Playlists on Home Setting Tests', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('showFavoritePlaylistsOnHome defaults to false and updates correctly',
        () async {
      final service = PlayerUiSettingsService();
      await service.initialize();

      expect(service.getShowFavoritePlaylistsOnHome(), isFalse);
      expect(service.showFavoritePlaylistsOnHomeNotifier.value, isFalse);

      await service.setShowFavoritePlaylistsOnHome(true);

      expect(service.getShowFavoritePlaylistsOnHome(), isTrue);
      expect(service.showFavoritePlaylistsOnHomeNotifier.value, isTrue);

      await service.setShowFavoritePlaylistsOnHome(false);

      expect(service.getShowFavoritePlaylistsOnHome(), isFalse);
      expect(service.showFavoritePlaylistsOnHomeNotifier.value, isFalse);
    });
  });
}
