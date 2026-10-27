import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/artist.dart';
import '../../providers/auth_provider.dart';
import '../../services/offline_service.dart';
import '../../services/player_ui_settings_service.dart';
import '../../services/recommendation_service.dart';
import '../../services/subsonic_service.dart';
import '../../services/theme_service.dart';
import '../../services/transcoding_service.dart';
import '../../widgets/common/album_artwork.dart';
import '../theme/octave_theme.dart';
import '../widgets/appearance_controls.dart';
import 'setup_progress.dart';
import 'setup_widgets.dart';

enum SetupStep {
  hello,
  color,
  mode,
  covers,
  artists,
  home,
  quality,
  offline,
  permissions,
  done,
}

/// Guided first setup, one question per screen (roadmap, section 4.6).
///
/// Each step has a recommended choice already selected, so "Continue"
/// is always safe; "Skip" leaves the current setting untouched. Theme
/// choices apply at once, the others when continuing.
class SetupFlow extends StatefulWidget {
  const SetupFlow({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<SetupFlow> createState() => _SetupFlowState();
}

class _SetupFlowState extends State<SetupFlow> {
  late final List<SetupStep> _steps;
  int _index = 0;
  bool _ready = false;

  /// Run again from About: starts at the first step, from the current
  /// settings, and leaves no step to resume.
  bool _rerun = false;

  /// Index of the furthest step shown (see [SetupProgress.furthestStep]).
  int _furthest = 0;

  String _shape = 'rounded';
  bool _favoritePlaylistsOnHome = true;
  bool _recommendations = true;
  int _wifiBitrate = TranscodeBitrate.original;
  int _mobileBitrate = TranscodeBitrate.kbps192;
  bool _autoDownload = true;

  List<Artist>? _artists;
  final Set<String> _starredArtistIds = {};
  final Set<String> _selectedArtistIds = {};

  PermissionStatus? _notifications;
  PermissionStatus? _battery;

  SetupStep get _step => _steps[_index];

  @override
  void initState() {
    super.initState();
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final config = auth.config;
    final serverLibrary = config != null &&
        !config.isLocal &&
        auth.state == AuthState.authenticated;
    final isAndroid = !kIsWeb && Platform.isAndroid;
    _steps = SetupStep.values.where((step) {
      switch (step) {
        case SetupStep.artists:
        case SetupStep.quality:
        case SetupStep.offline:
          return serverLibrary;
        case SetupStep.permissions:
          return isAndroid;
        default:
          return true;
      }
    }).toList();
    _restore();
  }

  /// The first time, recommended choices are preselected. A setup closed
  /// before its end resumes at the same step, and the steps already passed
  /// show what was saved; run again from About, every step starts from
  /// the current settings.
  Future<void> _restore() async {
    final saved = await SetupProgress.savedStep();
    final furthest = await SetupProgress.furthestStep();
    final rerun = await SetupProgress.isDone();
    final uiSettings = PlayerUiSettingsService();
    await uiSettings.initialize();
    await OfflineService().initialize();
    if (!mounted) return;
    final recommendations =
        Provider.of<RecommendationService>(context, listen: false);
    final transcoding =
        Provider.of<TranscodingService>(context, listen: false);
    setState(() {
      _rerun = rerun;
      final savedIndex =
          rerun ? -1 : _steps.indexWhere((s) => s.name == saved);
      if (savedIndex >= 0) _index = savedIndex;
      _furthest = rerun
          ? 0
          : [_index, _steps.indexWhere((s) => s.name == furthest)]
              .reduce((a, b) => a > b ? a : b);
      // Continue or Skip on a step left its setting saved: show that one.
      bool passed(SetupStep step) {
        final i = _steps.indexOf(step);
        return rerun || (i >= 0 && i < _furthest);
      }

      if (passed(SetupStep.covers)) _shape = uiSettings.getArtworkShape();
      if (passed(SetupStep.home)) {
        _favoritePlaylistsOnHome =
            uiSettings.getShowFavoritePlaylistsOnHome();
        _recommendations = recommendations.enabled;
      }
      if (passed(SetupStep.offline)) {
        _autoDownload = OfflineService().getAutoDownloadFavorites();
      }
      if (passed(SetupStep.quality)) {
        if (!transcoding.enabled) {
          _wifiBitrate = TranscodeBitrate.original;
          _mobileBitrate = TranscodeBitrate.original;
        } else {
          _wifiBitrate = transcoding.wifiBitrate == TranscodeBitrate.original
              ? TranscodeBitrate.original
              : TranscodeBitrate.kbps192;
          _mobileBitrate = _nearestChoice(transcoding.smartEnabled
              ? transcoding.mobileBitrate
              : transcoding.wifiBitrate);
        }
      }
      _ready = true;
    });
    _prepare(_step);
  }

  /// Maps any saved bitrate to one of the mobile choices shown.
  static int _nearestChoice(int bitrate) {
    if (bitrate == TranscodeBitrate.original) return bitrate;
    return bitrate <= TranscodeBitrate.kbps128
        ? TranscodeBitrate.kbps128
        : TranscodeBitrate.kbps192;
  }

  /// Loads what a step needs when it is shown. The summary counts the
  /// liked artists, also when the artists step was done before a restart.
  void _prepare(SetupStep step) {
    final needsArtists = step == SetupStep.artists ||
        (step == SetupStep.done && _steps.contains(SetupStep.artists));
    if (needsArtists && _artists == null) _loadArtists();
    if (step == SetupStep.permissions) _checkPermissions();
  }

  Future<void> _loadArtists() async {
    final subsonic = Provider.of<SubsonicService>(context, listen: false);
    try {
      final results = await Future.wait([
        subsonic.getArtists(),
        subsonic.getStarred(),
      ]);
      final artists = (results[0] as List<Artist>)
          .where((a) => !isCompilationArtist(a.name))
          .toList()
        ..sort((a, b) => (b.albumCount ?? 0).compareTo(a.albumCount ?? 0));
      final starred = (results[1] as SearchResult).artists;
      if (!mounted) return;
      setState(() {
        _artists = artists.take(60).toList();
        _starredArtistIds.addAll(starred.map((a) => a.id));
        _selectedArtistIds.addAll(_starredArtistIds);
      });
    } catch (e) {
      debugPrint('[Setup] Could not load artists: $e');
      if (mounted) setState(() => _artists = []);
    }
  }

  Future<void> _checkPermissions() async {
    final notifications = await Permission.notification.status;
    final battery = await Permission.ignoreBatteryOptimizations.status;
    if (!mounted) return;
    setState(() {
      _notifications = notifications;
      _battery = battery;
    });
  }

  Future<void> _request(Permission permission) async {
    await permission.request();
    await _checkPermissions();
  }

  void _goTo(int index) {
    setState(() => _index = index);
    if (!_rerun) {
      SetupProgress.saveStep(_step.name);
      if (index > _furthest) {
        _furthest = index;
        SetupProgress.saveFurthest(_step.name);
      }
    }
    _prepare(_step);
  }

  void _skip() {
    if (_index < _steps.length - 1) _goTo(_index + 1);
  }

  void _back() {
    if (_index > 0) _goTo(_index - 1);
  }

  Future<void> _continue() async {
    await _apply(_step);
    if (!mounted) return;
    if (_index < _steps.length - 1) {
      _goTo(_index + 1);
    } else {
      await _finish();
    }
  }

  Future<void> _finish() async {
    await SetupProgress.markDone();
    widget.onFinished();
  }

  /// Saves the choices of [step]; theme steps are already applied live.
  Future<void> _apply(SetupStep step) async {
    switch (step) {
      case SetupStep.covers:
        await PlayerUiSettingsService().setArtworkShape(_shape);
      case SetupStep.artists:
        await _starSelectedArtists();
      case SetupStep.home:
        await PlayerUiSettingsService()
            .setShowFavoritePlaylistsOnHome(_favoritePlaylistsOnHome);
        if (!mounted) return;
        await Provider.of<RecommendationService>(context, listen: false)
            .setEnabled(_recommendations);
      case SetupStep.quality:
        await _applyQuality();
      case SetupStep.offline:
        await OfflineService().initialize();
        await OfflineService().setAutoDownloadFavorites(_autoDownload);
      default:
        break;
    }
  }

  Future<void> _starSelectedArtists() async {
    final subsonic = Provider.of<SubsonicService>(context, listen: false);
    final toStar = _selectedArtistIds.difference(_starredArtistIds);
    final toUnstar = _starredArtistIds.difference(_selectedArtistIds);
    for (final id in toStar) {
      try {
        await subsonic.star(artistId: id);
        _starredArtistIds.add(id);
      } catch (e) {
        debugPrint('[Setup] Could not star artist $id: $e');
      }
    }
    for (final id in toUnstar) {
      try {
        await subsonic.unstar(artistId: id);
        _starredArtistIds.remove(id);
      } catch (e) {
        debugPrint('[Setup] Could not unstar artist $id: $e');
      }
    }
  }

  Future<void> _applyQuality() async {
    final transcoding =
        Provider.of<TranscodingService>(context, listen: false);
    final transcode = _wifiBitrate != TranscodeBitrate.original ||
        _mobileBitrate != TranscodeBitrate.original;
    await transcoding.setWifiBitrate(_wifiBitrate);
    await transcoding.setMobileBitrate(_mobileBitrate);
    if (transcode) await transcoding.setFormat(TranscodeFormat.opus);
    await transcoding.setSmartEnabled(transcode);
    await transcoding.setEnabled(transcode);
  }

  double get _progress => (_index + 1) / _steps.length;

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return Scaffold(backgroundColor: context.octave.background);
    }
    return PopScope(
      canPop: _index == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.04, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
        child: KeyedSubtree(
          key: ValueKey(_step),
          child: _buildStep(context),
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isFirst = _index == 0;
    final isLast = _index == _steps.length - 1;

    SetupScaffold page({
      required String title,
      String? body,
      Widget? child,
      String? primaryLabel,
      bool skippable = true,
    }) =>
        SetupScaffold(
          title: title,
          body: body,
          progress: isFirst ? null : _progress,
          progressLabel: l10n.setupStepOf(_index + 1, _steps.length),
          onBack: isFirst ? null : _back,
          onSkip: skippable && !isFirst && !isLast ? _skip : null,
          primaryLabel: primaryLabel ?? l10n.setupContinue,
          onPrimary: _continue,
          child: child,
        );

    switch (_step) {
      case SetupStep.hello:
        final config = Provider.of<AuthProvider>(context, listen: false).config;
        final name = config == null || config.isLocal
            ? ''
            : _capitalize(config.username);
        return SetupScaffold(
          title: l10n.setupHelloTitle(name).trim(),
          body: l10n.setupHelloBody,
          primaryLabel: l10n.setupHelloStart,
          onPrimary: _continue,
          secondaryLabel: l10n.setupSkipAll,
          onSecondary: _finish,
        );

      case SetupStep.color:
        final theme = Provider.of<ThemeService>(context);
        return page(
          title: l10n.setupColorTitle,
          body: l10n.setupColorBody,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SetupThemePreview(),
              const SizedBox(height: 24),
              OctaveColorSwatches(
                selected: theme.accentColor,
                size: 40,
                onChanged: theme.setAccentColor,
              ),
            ],
          ),
        );

      case SetupStep.mode:
        final theme = Provider.of<ThemeService>(context);
        return page(
          title: l10n.setupModeTitle,
          body: l10n.setupModeBody,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SetupThemePreview(),
              const SizedBox(height: 24),
              for (final mode in ThemeMode.values)
                SetupChoiceTile(
                  title: _modeName(l10n, mode),
                  icon: _modeIcon(mode),
                  recommended: mode == ThemeMode.system,
                  selected: theme.themeMode == mode,
                  onTap: () => theme.setThemeMode(mode),
                ),
              const SizedBox(height: 6),
              SetupSwitchTile(
                title: l10n.pureBlackLabel,
                subtitle: l10n.pureBlackSubtitle,
                value: theme.pureBlack,
                onChanged: theme.setPureBlack,
              ),
              const SizedBox(height: 12),
              SetupSectionLabel(l10n.colorIntensityLabel),
              OctaveIntensitySlider(
                value: theme.intensity,
                onChanged: theme.setIntensity,
              ),
            ],
          ),
        );

      case SetupStep.covers:
        return page(
          title: l10n.setupStyleTitle,
          body: l10n.setupStyleBody,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final shape in const ['rounded', 'square', 'circle'])
                SetupChoiceTile(
                  title: _shapeName(l10n, shape),
                  leading: _ShapeSample(shape: shape),
                  recommended: shape == 'rounded',
                  selected: _shape == shape,
                  onTap: () => setState(() => _shape = shape),
                ),
            ],
          ),
        );

      case SetupStep.artists:
        return page(
          title: l10n.setupArtistsTitle,
          body: l10n.setupArtistsBody,
          primaryLabel: _selectedArtistIds.isEmpty
              ? l10n.setupContinue
              : l10n.setupArtistsContinue(_selectedArtistIds.length),
          child: _buildArtists(context, l10n),
        );

      case SetupStep.home:
        return page(
          title: l10n.setupHomeTitle,
          body: l10n.setupHomeBody,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SetupSwitchTile(
                title: l10n.setupHomeFavoritePlaylists,
                subtitle: l10n.setupHomeFavoritePlaylistsDesc,
                value: _favoritePlaylistsOnHome,
                onChanged: (v) => setState(() => _favoritePlaylistsOnHome = v),
              ),
              SetupSwitchTile(
                title: l10n.setupHomeRecommendations,
                subtitle: l10n.setupHomeRecommendationsDesc,
                value: _recommendations,
                onChanged: (v) => setState(() => _recommendations = v),
              ),
            ],
          ),
        );

      case SetupStep.quality:
        return page(
          title: l10n.setupQualityTitle,
          body: l10n.setupQualityBody,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SetupSectionLabel(l10n.setupQualityWifi),
              for (final bitrate in const [
                TranscodeBitrate.original,
                TranscodeBitrate.kbps192,
              ])
                _qualityTile(l10n, bitrate,
                    selected: _wifiBitrate == bitrate,
                    recommended: bitrate == TranscodeBitrate.original,
                    onTap: () => setState(() => _wifiBitrate = bitrate)),
              const SizedBox(height: 14),
              SetupSectionLabel(l10n.setupQualityMobile),
              for (final bitrate in const [
                TranscodeBitrate.kbps128,
                TranscodeBitrate.kbps192,
                TranscodeBitrate.original,
              ])
                _qualityTile(l10n, bitrate,
                    selected: _mobileBitrate == bitrate,
                    recommended: bitrate == TranscodeBitrate.kbps192,
                    onTap: () => setState(() => _mobileBitrate = bitrate)),
            ],
          ),
        );

      case SetupStep.offline:
        return page(
          title: l10n.setupOfflineTitle,
          body: l10n.setupOfflineBody,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SetupChoiceTile(
                title: l10n.setupOfflineYes,
                subtitle: l10n.setupOfflineYesDesc,
                icon: Icons.download_for_offline_outlined,
                recommended: true,
                selected: _autoDownload,
                onTap: () => setState(() => _autoDownload = true),
              ),
              SetupChoiceTile(
                title: l10n.setupOfflineNo,
                subtitle: l10n.setupOfflineNoDesc,
                icon: Icons.touch_app_outlined,
                selected: !_autoDownload,
                onTap: () => setState(() => _autoDownload = false),
              ),
            ],
          ),
        );

      case SetupStep.permissions:
        return page(
          title: l10n.setupPermissionsTitle,
          body: l10n.setupPermissionsBody,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _PermissionTile(
                icon: Icons.notifications_none_rounded,
                title: l10n.setupPermNotifications,
                subtitle: l10n.setupPermNotificationsDesc,
                status: _notifications,
                onRequest: () => _request(Permission.notification),
              ),
              _PermissionTile(
                icon: Icons.battery_charging_full_rounded,
                title: l10n.setupPermBattery,
                subtitle: l10n.setupPermBatteryDesc,
                status: _battery,
                onRequest: () => _request(Permission.ignoreBatteryOptimizations),
              ),
            ],
          ),
        );

      case SetupStep.done:
        return page(
          title: l10n.setupDoneTitle,
          body: l10n.setupDoneBody,
          primaryLabel: l10n.setupDoneStart,
          skippable: false,
          child: _buildSummary(context, l10n),
        );
    }
  }

  Widget _buildArtists(BuildContext context, AppLocalizations l10n) {
    final colors = context.octave;
    final artists = _artists;
    if (artists == null) {
      return const Padding(
        padding: EdgeInsets.only(top: 40),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (artists.isEmpty) {
      return Text(l10n.setupArtistsEmpty,
          style: TextStyle(fontSize: 15, color: colors.text2));
    }
    return LayoutBuilder(builder: (context, constraints) {
      const spacing = 12.0;
      final columns = (constraints.maxWidth / 110).floor().clamp(3, 5);
      final width = (constraints.maxWidth - spacing * (columns - 1)) / columns;
      return Wrap(
        spacing: spacing,
        runSpacing: 18,
        children: [
          for (final artist in artists)
            SizedBox(
              width: width,
              child: _ArtistChoice(
                artist: artist,
                size: width,
                selected: _selectedArtistIds.contains(artist.id),
                onTap: () => setState(() {
                  if (!_selectedArtistIds.remove(artist.id)) {
                    _selectedArtistIds.add(artist.id);
                  }
                }),
              ),
            ),
        ],
      );
    });
  }

  Widget _buildSummary(BuildContext context, AppLocalizations l10n) {
    final colors = context.octave;
    final theme = Provider.of<ThemeService>(context);
    final rows = <(String, String)>[
      (l10n.setupSummaryColor, accentColorName(l10n, theme.accentColor)),
      (
        l10n.setupSummaryMode,
        theme.pureBlack && theme.themeMode != ThemeMode.light
            ? '${_modeName(l10n, theme.themeMode)} · ${l10n.pureBlackLabel}'
            : _modeName(l10n, theme.themeMode),
      ),
      (l10n.setupSummaryCovers, _shapeName(l10n, _shape)),
      if (_steps.contains(SetupStep.artists))
        (l10n.setupSummaryArtists, '${_starredArtistIds.length}'),
      if (_steps.contains(SetupStep.quality)) ...[
        (l10n.setupSummaryWifi, _qualityName(l10n, _wifiBitrate)),
        (l10n.setupSummaryMobile, _qualityName(l10n, _mobileBitrate)),
      ],
      if (_steps.contains(SetupStep.offline))
        (
          l10n.setupSummaryOffline,
          _autoDownload ? l10n.setupYes : l10n.setupNo,
        ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: colors.surface1,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.separator),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            if (i > 0) Divider(height: 1, indent: 16, color: colors.separator),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(rows[i].$1,
                        style: TextStyle(fontSize: 15, color: colors.text2)),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      rows[i].$2,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: colors.text1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _qualityTile(
    AppLocalizations l10n,
    int bitrate, {
    required bool selected,
    required bool recommended,
    required VoidCallback onTap,
  }) {
    final subtitle = switch (bitrate) {
      TranscodeBitrate.original => l10n.setupQualityBestDesc,
      TranscodeBitrate.kbps128 => l10n.setupQualitySaverDesc,
      _ => l10n.setupQualityBalancedDesc,
    };
    return SetupChoiceTile(
      title: _qualityName(l10n, bitrate),
      subtitle: subtitle,
      recommended: recommended,
      selected: selected,
      onTap: onTap,
    );
  }

  static String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  static String _qualityName(AppLocalizations l10n, int bitrate) =>
      switch (bitrate) {
        TranscodeBitrate.original => l10n.setupQualityBest,
        TranscodeBitrate.kbps128 => l10n.setupQualitySaver,
        _ => l10n.setupQualityBalanced,
      };

  static String _modeName(AppLocalizations l10n, ThemeMode mode) =>
      switch (mode) {
        ThemeMode.system => l10n.setupModeAuto,
        ThemeMode.light => l10n.setupModeLight,
        ThemeMode.dark => l10n.setupModeDark,
      };

  static IconData _modeIcon(ThemeMode mode) => switch (mode) {
        ThemeMode.system => Icons.brightness_auto_outlined,
        ThemeMode.light => Icons.light_mode_outlined,
        ThemeMode.dark => Icons.dark_mode_outlined,
      };

  static String _shapeName(AppLocalizations l10n, String shape) =>
      switch (shape) {
        'square' => l10n.setupStyleSquare,
        'circle' => l10n.setupStyleCircle,
        _ => l10n.setupStyleRounded,
      };
}

/// The artist that compilations are filed under ("Various Artists"):
/// nobody picks it as a favorite, and it has more albums than anyone, so
/// it would come first.
bool isCompilationArtist(String name) => const {
      'various artists',
      'various',
      'va',
      'artistes divers',
      'divers',
    }.contains(name.trim().toLowerCase());

class _ShapeSample extends StatelessWidget {
  const _ShapeSample({required this.shape});

  final String shape;

  @override
  Widget build(BuildContext context) {
    final radius = switch (shape) {
      'square' => 0.0,
      'circle' => 20.0,
      _ => 8.0,
    };
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.octave.accentSoft,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(Icons.music_note_rounded,
          size: 18, color: context.octave.onAccentSoft),
    );
  }
}

class _ArtistChoice extends StatelessWidget {
  const _ArtistChoice({
    required this.artist,
    required this.size,
    required this.selected,
    required this.onTap,
  });

  final Artist artist;
  final double size;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    return Semantics(
      selected: selected,
      button: true,
      label: artist.name,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? colors.accent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: AlbumArtwork(
                      coverArt: artist.coverArt ??
                          artist.artistImageUrl ??
                          (artist.id.isNotEmpty ? 'ar-${artist.id}' : null),
                      size: size - 10,
                      borderRadius: size,
                      shadow: const BoxShadow(color: Colors.transparent),
                    ),
                  ),
                ),
                if (selected)
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: colors.accent,
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.background, width: 2),
                      ),
                      child: Icon(Icons.check_rounded,
                          size: 14, color: colors.onAccent),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              artist.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? colors.text1 : colors.text2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  const _PermissionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.onRequest,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final PermissionStatus? status;
  final VoidCallback onRequest;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    final granted = status?.isGranted ?? false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
        decoration: BoxDecoration(
          color: colors.surface1,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colors.separator),
        ),
        child: Row(
          children: [
            Icon(icon, size: 22, color: colors.text2),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colors.text1,
                      )),
                  const SizedBox(height: 3),
                  Text(subtitle,
                      style: TextStyle(fontSize: 13, color: colors.text2)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (granted)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_rounded, size: 18, color: colors.success),
                  const SizedBox(width: 4),
                  Text(l10n.setupPermGranted,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colors.success,
                      )),
                ],
              )
            else
              OutlinedButton(
                onPressed: status == null ? null : onRequest,
                child: Text(l10n.setupPermAllow),
              ),
          ],
        ),
      ),
    );
  }
}
