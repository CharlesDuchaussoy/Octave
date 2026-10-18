import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ReleaseAsset {
  final String name;
  final String browserDownloadUrl;
  final int? size;

  const ReleaseAsset({
    required this.name,
    required this.browserDownloadUrl,
    this.size,
  });

  factory ReleaseAsset.fromJson(Map<String, dynamic> json) => ReleaseAsset(
        name: json['name'] as String? ?? '',
        browserDownloadUrl: json['browser_download_url'] as String? ?? '',
        size: json['size'] as int?,
      );

  String get formattedSize {
    if (size == null || size! <= 0) return '';
    final mb = size! / (1024 * 1024);
    return '${mb.toStringAsFixed(1)} MB';
  }
}

class ReleaseInfo {
  final String version;
  final String tagName;
  final String htmlUrl;
  final String body;
  final List<ReleaseAsset> assets;

  const ReleaseInfo({
    required this.version,
    required this.tagName,
    required this.htmlUrl,
    required this.body,
    required this.assets,
  });

  factory ReleaseInfo.fromJson(Map<String, dynamic> json) {
    final tag = json['tag_name'] as String? ?? '';
    return ReleaseInfo(
      version: tag.replaceFirst(RegExp(r'^v'), ''),
      tagName: tag,
      htmlUrl: json['html_url'] as String? ?? '',
      body: json['body'] as String? ?? '',
      assets: (json['assets'] as List<dynamic>?)
              ?.map((a) => ReleaseAsset.fromJson(a as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  ReleaseAsset? get targetAsset {
    if (assets.isEmpty) return null;

    if (!kIsWeb && Platform.isAndroid) {
      final apk = assets.firstWhere(
        (a) => a.name.endsWith('.apk'),
        orElse: () => assets.first,
      );
      return apk;
    }

    if (!kIsWeb && Platform.isWindows) {
      final exe = assets.firstWhere(
        (a) => a.name.toLowerCase().endsWith('-setup.exe') ||
            a.name.toLowerCase().endsWith('.exe'),
        orElse: () => assets.first,
      );
      return exe;
    }

    if (!kIsWeb && Platform.isMacOS) {
      final dmg = assets.firstWhere(
        (a) => a.name.endsWith('.dmg'),
        orElse: () => assets.first,
      );
      return dmg;
    }

    if (!kIsWeb && Platform.isLinux) {
      final linux = assets.firstWhere(
        (a) => a.name.contains('linux') || a.name.endsWith('.tar.gz') || a.name.endsWith('.AppImage'),
        orElse: () => assets.first,
      );
      return linux;
    }

    return assets.isNotEmpty ? assets.first : null;
  }
}

class UpdateService {
  static const String currentVersion = '2.0.3';

  static const String _apiUrl =
      'https://api.github.com/repos/dddevid/Musly/releases/latest';

  static const String _skippedVersionKey = 'skipped_update_version';
  static const String _lastCheckTimestampKey = 'last_update_check_timestamp';
  static const Duration checkInterval = Duration(hours: 24);

  static final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28',
      },
    ),
  );

  static Future<ReleaseInfo?> checkForUpdate({bool force = false}) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (!force) {
        final lastCheckMillis = prefs.getInt(_lastCheckTimestampKey) ?? 0;
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now - lastCheckMillis < checkInterval.inMilliseconds) {
          debugPrint('UpdateService: skipping check (checked within last 24h)');
          return null;
        }
      }

      final response = await _dio.get<Map<String, dynamic>>(_apiUrl);
      final data = response.data;
      if (data == null) return null;

      await prefs.setInt(
          _lastCheckTimestampKey, DateTime.now().millisecondsSinceEpoch);

      final release = ReleaseInfo.fromJson(data);
      if (_isNewer(release.version, currentVersion)) {
        if (!force) {
          final skippedVersion = prefs.getString(_skippedVersionKey);
          if (skippedVersion == release.version) {
            debugPrint(
                'UpdateService: version ${release.version} was skipped by user');
            return null;
          }
        }
        return release;
      }
      return null;
    } catch (e) {
      debugPrint('UpdateService: check failed – $e');
      return null;
    }
  }

  static Future<void> skipVersion(String version) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_skippedVersionKey, version);
  }

  static bool isNewerVersion(String remote, String current) =>
      _isNewer(remote, current);

  static bool _isNewer(String remote, String current) {
    try {
      List<int> parse(String v) =>
          v.split('.').map((p) => int.tryParse(p) ?? 0).toList();

      final r = parse(remote);
      final c = parse(current);
      final len = r.length > c.length ? r.length : c.length;
      while (r.length < len) {
        r.add(0);
      }
      while (c.length < len) {
        c.add(0);
      }

      for (int i = 0; i < len; i++) {
        if (r[i] > c[i]) return true;
        if (r[i] < c[i]) return false;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  static Future<String> downloadAsset(
    ReleaseAsset asset, {
    void Function(int received, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final tempDir = await getTemporaryDirectory();
    final sanitizedName = asset.name.replaceAll(RegExp(r'[^\w\.-]'), '_');
    final filePath = '${tempDir.path}/$sanitizedName';

    final downloadDio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(minutes: 15),
      ),
    );

    await downloadDio.download(
      asset.browserDownloadUrl,
      filePath,
      onReceiveProgress: onProgress,
      cancelToken: cancelToken,
    );

    return filePath;
  }

  static Future<bool> launchInstallerOrFile(
    String filePath, {
    ReleaseInfo? release,
  }) async {
    try {
      if (!kIsWeb && Platform.isWindows) {
        await Process.start(filePath, [], runInShell: true);
        return true;
      }

      if (!kIsWeb && Platform.isAndroid) {
        final uri = Uri.parse(release?.targetAsset?.browserDownloadUrl ??
            release?.htmlUrl ??
            'https://github.com/dddevid/Musly/releases/latest');
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      }

      final uri = Uri.file(filePath);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri);
      }
    } catch (e) {
      debugPrint('UpdateService: failed to launch file: $e');
    }

    if (release != null) {
      return await openReleasePage(release);
    }
    return false;
  }

  static Future<bool> openReleasePage(ReleaseInfo release) async {
    final uri = Uri.parse(release.htmlUrl);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  static Future<bool> openAssetDownloadUrl(ReleaseAsset asset) async {
    final uri = Uri.parse(asset.browserDownloadUrl);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  static String stripMarkdown(String md) {
    return md
        .replaceAll(RegExp(r'^#{1,6}\s+', multiLine: true), '')
        .replaceAllMapped(RegExp(r'\*\*(.*?)\*\*'), (m) => m.group(1) ?? '')
        .replaceAllMapped(RegExp(r'\*(.*?)\*'), (m) => m.group(1) ?? '')
        .replaceAllMapped(RegExp(r'`{1,3}(.*?)`{1,3}'), (m) => m.group(1) ?? '')
        .replaceAllMapped(
            RegExp(r'\[([^\]]+)\]\([^)]+\)'), (m) => m.group(1) ?? '')
        .replaceAll(RegExp(r'^---+$', multiLine: true), '─────────────')
        .trim();
  }
}
