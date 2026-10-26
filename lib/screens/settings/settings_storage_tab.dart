import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/providers/library_provider.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/services/cache_settings_service.dart';
import 'package:musly/services/local_music_service.dart';
import 'package:musly/services/offline_service.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/screens/media/download_playlist_status_screen.dart';
import 'package:path/path.dart' as p;
import 'package:musly/widgets/settings/settings_section_card.dart';
import 'package:musly/widgets/settings/settings_switch_tile.dart';
import 'package:musly/widgets/settings/settings_list_tile.dart';
import 'package:musly/octave/widgets/scroll_end_padding.dart';


class SettingsStorageTab extends StatefulWidget {
  const SettingsStorageTab({super.key});

  @override
  State<SettingsStorageTab> createState() => _SettingsStorageTabState();
}

class _SettingsStorageTabState extends State<SettingsStorageTab> {
  final _cacheSettings = CacheSettingsService();
  final _offlineService = OfflineService();

  int _downloadedCount = 0;
  String _downloadedSize = '0 B';
  String _totalCacheSize = '0 B';
  bool _autoDownloadFavorites = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _setupDownloadListener();
  }

  @override
  void dispose() {
    _offlineService.downloadState.removeListener(_onDownloadStateChanged);
    super.dispose();
  }

  void _setupDownloadListener() {
    _offlineService.downloadState.addListener(_onDownloadStateChanged);
  }

  void _onDownloadStateChanged() {
    if (!mounted) return;
    final state = _offlineService.downloadState.value;
    setState(() {
      _downloadedCount = state.downloadedCount;
    });
  }

  Future<void> _loadSettings() async {
    await _cacheSettings.initialize();
    await _offlineService.initialize();
    await _loadOfflineInfo();
    await _loadCacheInfo();

    setState(() {
      _autoDownloadFavorites = _offlineService.getAutoDownloadFavorites();
    });
  }

  Future<void> _loadCacheInfo() async {
    final audioBytes = await _cacheSettings.getAudioCacheSizeBytes();
    final imageBytes = await _cacheSettings.getImageCacheSizeBytes();
    final totalBytes = audioBytes + imageBytes;
    if (mounted) {
      setState(() {
        _totalCacheSize = _cacheSettings.formatBytes(totalBytes);
      });
    }
  }

  Future<void> _loadOfflineInfo() async {
    final count = _offlineService.getDownloadedCount();
    final size = await _offlineService.getDownloadedSize();
    if (mounted) {
      setState(() {
        _downloadedCount = count;
        _downloadedSize = _offlineService.formatSize(size);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 16, bottom: scrollEndPadding(context)),
      children: [
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionCacheCleanup,
          children: [
            _buildClearAllCacheButton(),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionOfflineDownloads,
          children: [
            _buildAutoDownloadFavoritesTile(),
            const SettingsDivider(),
            _buildOfflineInfo(),
            const SettingsDivider(),
            _buildActiveDownloadsRow(),
            const SettingsDivider(),
            _buildPlaylistStatusRow(),
            const SettingsDivider(),
            _buildDownloadAllLibraryButton(),
            const SettingsDivider(),
            _buildDeleteDownloadsButton(),
          ],
        ),
        const SizedBox(height: 24),
        _buildLocalMusicSection(),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildLocalMusicSection() {
    return Consumer<LocalMusicService>(
      builder: (context, localMusic, _) {
        final l10n = AppLocalizations.of(context)!;
        final customPaths = localMusic.customScanPaths;

        return SettingsSectionCard(
          title: l10n.localMusicLibrary,
          children: [
            SettingsSwitchTile(
              icon: CupertinoIcons.music_albums,
              title: l10n.mergeLocalLibrary,
              subtitle: l10n.mergeLocalLibrarySubtitle,
              value: context.watch<LibraryProvider>().mergeLocalLibrary,
              onChanged: (value) {
                final libraryProvider = context.read<LibraryProvider>();
                if (value) {
                  libraryProvider.setLocalMusicService(localMusic,
                      mergeWithServer: true);
                } else {
                  libraryProvider.setMergeLocalLibrary(false);
                }
              },
            ),
            const SettingsDivider(),
            SettingsListTile(
              icon: CupertinoIcons.music_note,
              title: l10n.localMusicStats,
              subtitle: localMusic.isScanning ? localMusic.scanStatus : null,
              trailing: Text(
                '${localMusic.songCount} ${l10n.songs.toLowerCase()}',
                style: TextStyle(
                  fontSize: 14,
                  color: context.octave.text2,
                ),
              ),
            ),
            const SettingsDivider(),
            SettingsListTile(
              icon: CupertinoIcons.plus,
              title: l10n.addMusicFolder,
              onTap: () => _addMusicFolder(context, localMusic),
            ),
            if (customPaths.isNotEmpty) ...[
              const SettingsDivider(),
              ...customPaths.map((path) => SettingsListTile(
                    icon: CupertinoIcons.folder_fill,
                    title: p.basename(path),
                    subtitle: path,
                    trailing: IconButton(
                      icon: Icon(CupertinoIcons.delete,
                          color: context.octave.danger, size: 20),
                      onPressed: () =>
                          _removeMusicFolder(context, localMusic, path),
                    ),
                  )),
            ],
            const SettingsDivider(),
            SettingsListTile(
              icon: CupertinoIcons.refresh,
              title: l10n.rescanLocalMusic,
              onTap: localMusic.isScanning ? null : () => _rescanLocalMusic(context, localMusic),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addMusicFolder(
      BuildContext context, LocalMusicService service) async {
    final path = await service.pickMusicDirectory();
    if (path == null) return;
    if (!context.mounted) return;
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.folderAdded(path))),
    );

    final libraryProvider = context.read<LibraryProvider>();
    if (libraryProvider.mergeLocalLibrary) {
      service.scanForMusic();
    }
  }

  Future<void> _removeMusicFolder(
      BuildContext context, LocalMusicService service, String path) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.removeFolderTitle),
        content: Text(l10n.removeFolderConfirm(path)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.remove, style: TextStyle(color: context.octave.danger)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    await service.removeCustomScanPath(path);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.folderRemoved)),
    );
  }

  Widget _buildAutoDownloadFavoritesTile() {
    return SettingsSwitchTile(
      icon: CupertinoIcons.heart_solid,
      title: AppLocalizations.of(context)!.autoDownloadFavorites,
      subtitle: AppLocalizations.of(context)!.autoDownloadFavoritesSubtitle,
      value: _autoDownloadFavorites,
      onChanged: _toggleAutoDownloadFavorites,
    );
  }

  Future<void> _rescanLocalMusic(
      BuildContext context, LocalMusicService service) async {
    if (service.isScanning) return;

    final hasPermission = await service.requestPermission();
    if (!hasPermission) {
      if (context.mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.storagePermissionRequired)),
        );
      }
      return;
    }

    await service.scanForMusic();
  }

  Widget _buildClearAllCacheButton() {
    final l10n = AppLocalizations.of(context)!;
    return SettingsListTile(
      icon: CupertinoIcons.trash_fill,
      title: l10n.clearAllCache,
      subtitle: l10n.totalCacheDiskUsage(_totalCacheSize),
      onTap: _clearAllCache,
    );
  }

  void _toggleAutoDownloadFavorites(bool value) async {
    setState(() => _autoDownloadFavorites = value);
    await _offlineService.setAutoDownloadFavorites(value);
  }

  void _clearAllCache() async {
    await _cacheSettings.clearAllCache();
    await _loadCacheInfo();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.allCacheCleared)),
      );
    }
  }

  Widget _buildOfflineInfo() {
    return SettingsListTile(
      icon: CupertinoIcons.arrow_down_circle,
      title: AppLocalizations.of(context)!.downloadedSongs,
      trailing: Text(
        AppLocalizations.of(
          context,
        )!
            .downloadedStats(_downloadedCount, _downloadedSize),
        style: TextStyle(
          fontSize: 14,
          color: context.octave.text2,
        ),
      ),
    );
  }

  Widget _buildActiveDownloadsRow() {
    final l10n = AppLocalizations.of(context)!;
    return ValueListenableBuilder<DownloadState>(
      valueListenable: _offlineService.downloadState,
      builder: (context, state, _) {
        final subtitle = state.isDownloading && state.currentSong != null
            ? '${state.currentSong!.artist ?? ''} – ${state.currentSong!.title}  (${state.currentProgress}/${state.totalCount})'
            : state.isDownloading
                ? '${state.currentProgress}/${state.totalCount}'
                : l10n.noDownloadsInProgress;
        return SettingsListTile(
          icon: state.isDownloading
              ? CupertinoIcons.arrow_down_circle_fill
              : CupertinoIcons.arrow_down_circle,
          title: l10n.activeDownloads,
          subtitle: subtitle,
          trailing: const Icon(CupertinoIcons.chevron_right, size: 16),
        );
      },
    );
  }

  Widget _buildPlaylistStatusRow() {
    final l10n = AppLocalizations.of(context)!;
    return ValueListenableBuilder<Set<String>>(
      valueListenable: _offlineService.downloadedSongIds,
      builder: (context, ids, _) {
        return SettingsListTile(
          icon: CupertinoIcons.music_note_list,
          title: l10n.playlistDownloads,
          subtitle: l10n.playlistSongsDownloadedCount(ids.length),
          trailing: const Icon(CupertinoIcons.chevron_right, size: 16),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const DownloadPlaylistStatusScreen(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDownloadAllLibraryButton() {
    return ValueListenableBuilder<DownloadState>(
      valueListenable: _offlineService.downloadState,
      builder: (context, downloadState, _) {
        final isDownloading = downloadState.isDownloading;
        final progress = downloadState.totalCount > 0
            ? downloadState.currentProgress / downloadState.totalCount
            : 0.0;

        if (isDownloading) {
          return Column(
            children: [
              SettingsListTile(
                icon: CupertinoIcons.arrow_down_circle_fill,
                title: AppLocalizations.of(context)!.downloadingLibrary(
                    downloadState.currentProgress,
                    downloadState.totalCount,
                  ),
                trailing: IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {
                    _offlineService.cancelBackgroundDownload();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: context.octave.separator,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.octave.success,
                  ),
                ),
              ),
            ],
          );
        }

        return SettingsListTile(
          icon: CupertinoIcons.cloud_download,
          title: AppLocalizations.of(context)!.downloadAllLibrary,
          onTap: _downloadAllLibrary,
        );
      },
    );
  }

  Future<void> _downloadAllLibrary() async {
    try {
      final libraryProvider = context.read<LibraryProvider>();
      final subsonicService = context.read<SubsonicService>();
      final l10n = AppLocalizations.of(context)!;

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.loadingLibrary),
            duration: const Duration(seconds: 1),
          ),
        );
      }

      await libraryProvider.ensureLibraryLoaded();

      if (libraryProvider.cachedAllSongs.isEmpty) {
        await Future.delayed(const Duration(milliseconds: 500));

        await libraryProvider.refresh();
      }

      final allSongs = libraryProvider.cachedAllSongs;

      if (allSongs.isEmpty) {
        if (!mounted) return;
        final retry = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(l10n.noSongsAvailable),
            content: Text(l10n.libraryEmptyError),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(l10n.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(l10n.retry),
              ),
            ],
          ),
        );
        if (retry == true) {
          return await _downloadAllLibrary();
        }
        return;
      }

      if (!mounted) return;
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.downloadAllLibrary),
          content: Text(
            AppLocalizations.of(
              context,
            )!
                .downloadLibraryConfirm(allSongs.length),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(AppLocalizations.of(context)!.download),
            ),
          ],
        ),
      );

      if (confirm != true || !mounted) return;

      await _offlineService.startBackgroundDownload(allSongs, subsonicService);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.libraryDownloadStarted),
            duration: const Duration(seconds: 2),
          ),
        );
        await _loadOfflineInfo();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.errorStartingDownload(e),
            ),
            backgroundColor: context.octave.danger,
          ),
        );
      }
    }
  }

  Widget _buildDeleteDownloadsButton() {
    return SettingsListTile(
      icon: CupertinoIcons.trash_fill,
      title: AppLocalizations.of(context)!.deleteDownloads,
      onTap: () async {
        await _offlineService.deleteAllDownloads();
        await _loadOfflineInfo();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.downloadsDeleted),
            ),
          );
        }
      },
    );
  }

}
