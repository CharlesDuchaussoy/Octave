import 'package:flutter_test/flutter_test.dart';
import 'package:musly/models/server_config.dart';
import 'package:musly/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('StorageService', () {
    late StorageService storageService;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      storageService = StorageService();
    });

    test('keeps Navidrome profiles', () async {
      await storageService.saveProfile(ServerConfig(
        serverUrl: 'https://music.example.com',
        username: 'leonie',
        password: '',
      ));
      final profiles = await storageService.getSavedProfiles();
      expect(profiles.map((p) => p.username), ['leonie']);
    });

    test('ignores profiles of servers Octave no longer supports', () async {
      await storageService.saveProfile(ServerConfig(
        serverUrl: 'https://music.youtube.com',
        username: 'Web Stream',
        password: '',
        serverFamily: 'youtube',
      ));
      // StorageService is shared between tests: only check this profile.
      final profiles = await storageService.getSavedProfiles();
      expect(profiles.where((p) => p.serverFamily == 'youtube'), isEmpty);
    });
  });
}
