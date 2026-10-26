import 'package:flutter_test/flutter_test.dart';
import 'package:musly/services/update_service.dart';

void main() {
  group('UpdateService - Version Comparison', () {
    test('correctly identifies newer semantic versions', () {
      expect(UpdateService.isNewerVersion('2.0.4', '2.0.3'), isTrue);
      expect(UpdateService.isNewerVersion('2.1.0', '2.0.3'), isTrue);
      expect(UpdateService.isNewerVersion('3.0.0', '2.0.3'), isTrue);
      expect(UpdateService.isNewerVersion('2.0.3.1', '2.0.3'), isTrue);
      expect(UpdateService.isNewerVersion('10.0.0', '2.9.9'), isTrue);
    });

    test('correctly identifies older or equal versions', () {
      expect(UpdateService.isNewerVersion('2.0.3', '2.0.3'), isFalse);
      expect(UpdateService.isNewerVersion('2.0.2', '2.0.3'), isFalse);
      expect(UpdateService.isNewerVersion('2.0.1', '2.0.3'), isFalse);
      expect(UpdateService.isNewerVersion('1.9.9', '2.0.3'), isFalse);
      expect(UpdateService.isNewerVersion('2.0.0', '2.0.3'), isFalse);
    });
  });

  group('ReleaseAsset', () {
    test('parses from JSON correctly', () {
      final json = {
        'name': 'musly-setup.exe',
        'browser_download_url':
            'https://github.com/dddevid/Musly/releases/download/v2.1.0/musly-setup.exe',
        'size': 68157440,
      };

      final asset = ReleaseAsset.fromJson(json);
      expect(asset.name, 'musly-setup.exe');
      expect(asset.browserDownloadUrl,
          'https://github.com/dddevid/Musly/releases/download/v2.1.0/musly-setup.exe');
      expect(asset.size, 68157440);
      expect(asset.formattedSize, '65.0 MB');
    });

    test('formattedSize handles null and zero correctly', () {
      const emptyAsset = ReleaseAsset(name: 'test', browserDownloadUrl: 'url');
      expect(emptyAsset.formattedSize, '');

      const zeroAsset =
          ReleaseAsset(name: 'test', browserDownloadUrl: 'url', size: 0);
      expect(zeroAsset.formattedSize, '');
    });
  });

  group('ReleaseInfo', () {
    test('parses ReleaseInfo from GitHub release JSON', () {
      final json = {
        'tag_name': 'v2.1.0',
        'html_url': 'https://github.com/dddevid/Musly/releases/tag/v2.1.0',
        'body': '## What\'s Changed\n* Added Spotify import by @dddevid in #10',
        'assets': [
          {
            'name': 'musly-setup.exe',
            'browser_download_url':
                'https://github.com/dddevid/Musly/releases/download/v2.1.0/musly-setup.exe',
            'size': 52428800,
          },
          {
            'name': 'app-release.apk',
            'browser_download_url':
                'https://github.com/dddevid/Musly/releases/download/v2.1.0/app-release.apk',
            'size': 31457280,
          },
          {
            'name': 'musly-macos.dmg',
            'browser_download_url':
                'https://github.com/dddevid/Musly/releases/download/v2.1.0/musly-macos.dmg',
            'size': 41943040,
          },
        ],
      };

      final release = ReleaseInfo.fromJson(json);
      expect(release.version, '2.1.0');
      expect(release.tagName, 'v2.1.0');
      expect(release.htmlUrl,
          'https://github.com/dddevid/Musly/releases/tag/v2.1.0');
      expect(release.assets.length, 3);
      expect(release.targetAsset, isNotNull);
    });

    test('assetFor picks the installer of each platform', () {
      const names = [
        'octave-macos.dmg',
        'octave-setup.exe',
        'octave-linux-x86_64.tar.gz',
        'app-armeabi-v7a-release.apk',
        'app-arm64-v8a-release.apk',
        'app-release.apk',
      ];
      final release = ReleaseInfo(
        version: '1.1.0',
        tagName: 'v1.1.0',
        htmlUrl: 'html-url',
        body: 'notes',
        assets: [
          for (final name in names)
            ReleaseAsset(name: name, browserDownloadUrl: '$name-url'),
        ],
      );

      expect(release.assetFor('android')!.name, 'app-arm64-v8a-release.apk');
      expect(release.assetFor('windows')!.name, 'octave-setup.exe');
      expect(release.assetFor('macos')!.name, 'octave-macos.dmg');
      expect(release.assetFor('linux')!.name, 'octave-linux-x86_64.tar.gz');
    });

    test('assetFor falls back to the universal APK', () {
      final release = ReleaseInfo(
        version: '1.1.0',
        tagName: 'v1.1.0',
        htmlUrl: 'html-url',
        body: 'notes',
        assets: const [
          ReleaseAsset(
              name: 'app-x86_64-release.apk', browserDownloadUrl: 'x86'),
          ReleaseAsset(name: 'app-release.apk', browserDownloadUrl: 'fat'),
        ],
      );
      expect(release.assetFor('android')!.browserDownloadUrl, 'fat');
    });
  });

  group('UpdateService - stripMarkdown', () {
    test('cleans markdown headers, bold, italics, and links', () {
      const raw =
          '# Release Notes\n\n**Feature**: Added [new player](https://link.com) and *speed improvements*.\n`Fixed bug`';
      final clean = UpdateService.stripMarkdown(raw);
      expect(clean.contains('#'), isFalse);
      expect(clean.contains('**'), isFalse);
      expect(clean.contains('*speed'), isFalse);
      expect(clean.contains('`'), isFalse);
      expect(clean.contains('https://link.com'), isFalse);
      expect(clean.contains('new player'), isTrue);
      expect(clean.contains('Feature: Added new player and speed improvements.'),
          isTrue);
      expect(clean.contains('Fixed bug'), isTrue);
    });
  });

  group('UpdateService - Startup Check Lifecycle', () {
    test('tracks startup check state correctly', () {
      UpdateService.resetStartupCheck();
      expect(UpdateService.hasCheckedStartup, isFalse);

      UpdateService.markStartupChecked();
      expect(UpdateService.hasCheckedStartup, isTrue);

      UpdateService.resetStartupCheck();
      expect(UpdateService.hasCheckedStartup, isFalse);
    });
  });
}
