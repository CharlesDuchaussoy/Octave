import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:musly/services/recommendation_service.dart';
import 'package:musly/services/player_ui_settings_service.dart';
import 'package:musly/services/theme_service.dart';
import 'package:musly/services/locale_service.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/widgets/settings/settings_section_card.dart';
import 'package:musly/widgets/settings/settings_switch_tile.dart';
import 'package:musly/octave/widgets/appearance_controls.dart';
import 'package:musly/widgets/settings/settings_icon_badge.dart';
import 'package:musly/utils/context_extensions.dart';
import 'package:musly/services/storage_service.dart';
import 'package:musly/widgets/common/album_artwork.dart';
import 'package:window_manager/window_manager.dart';
import 'package:musly/octave/widgets/scroll_end_padding.dart';

class SettingsDisplayTab extends StatefulWidget {
  const SettingsDisplayTab({super.key});

  @override
  State<SettingsDisplayTab> createState() => _SettingsDisplayTabState();
}

class _SettingsDisplayTabState extends State<SettingsDisplayTab> {
  final _playerUiSettings = PlayerUiSettingsService();
  bool _showVolumeSlider = true;
  bool _showStarRatings = false;
  bool _showMiniPlayerHeart = false;
  bool _showMiniPlayerRepeat = false;
  bool _showMiniPlayerShuffle = false;
  bool _showLiveLyricUnderArtwork = false;
  bool _liveSearch = true;
  bool _showFavoritePlaylistsOnHome = false;
  bool _lyricsBlurUnfocused = false;
  String _lyricsAlignment = 'left';
  bool _lyricsGlowEffect = true;
  bool _lyricsKeepScreenOn = true;
  bool _hideWindowTitlebar = false;
  String _artworkResolution = 'normal';

  ThemeMode _themeMode = ThemeMode.system;
  AccentColor _accentColor = AccentColor.octave;
  bool _liquidGlass = false;
  bool _pureBlack = false;
  double _intensity = OctavePalette.defaultIntensity;

  bool get _isDesktop {
    if (kIsWeb) return false;
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await _playerUiSettings.initialize();

    if (!mounted) return;
    final themeService = Provider.of<ThemeService>(context, listen: false);

    setState(() {
      _showVolumeSlider = _playerUiSettings.getShowVolumeSlider();
      _showStarRatings = _playerUiSettings.getShowStarRatings();
      _showMiniPlayerHeart = _playerUiSettings.getShowMiniPlayerHeart();
      _showMiniPlayerRepeat = _playerUiSettings.getShowMiniPlayerRepeat();
      _showMiniPlayerShuffle = _playerUiSettings.getShowMiniPlayerShuffle();
      _showLiveLyricUnderArtwork =
          _playerUiSettings.getShowLiveLyricUnderArtwork();
      _liveSearch = _playerUiSettings.getLiveSearch();
      _showFavoritePlaylistsOnHome =
          _playerUiSettings.getShowFavoritePlaylistsOnHome();
      _lyricsBlurUnfocused = _playerUiSettings.getLyricsBlurUnfocused();
      _lyricsAlignment = _playerUiSettings.getLyricsAlignment();
      _lyricsGlowEffect = _playerUiSettings.getLyricsGlowEffect();
      _lyricsKeepScreenOn = _playerUiSettings.getLyricsKeepScreenOn();
      _artworkResolution = _playerUiSettings.getArtworkResolution();
      _themeMode = themeService.themeMode;
      _accentColor = themeService.accentColor;
      _liquidGlass = themeService.liquidGlass;
      _pureBlack = themeService.pureBlack;
      _intensity = themeService.intensity;
    });

    if (_isDesktop) {
      final hide = await StorageService().getHideWindowTitlebar();
      if (mounted) setState(() => _hideWindowTitlebar = hide);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isYoutube =
        Provider.of<SubsonicService>(context, listen: false).isYoutube;

    return ListView(
      padding: EdgeInsets.only(top: 16, bottom: scrollEndPadding(context)),
      children: [
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.appearanceSection.toUpperCase(),
          children: [_buildAppearanceEditor()],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.language.toUpperCase(),
          children: [
            _buildLanguageSelector(),
            const SettingsDivider(),
            _buildTranslationCredit(),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.playerInterface.toUpperCase(),
          children: [
            _buildVolumeSliderToggle(),
            if (!isYoutube) ...[
              const SettingsDivider(),
              _buildStarRatingsToggle(),
            ],
            const SettingsDivider(),
            _buildLiveLyricUnderArtworkToggle(),
            const SettingsDivider(),
            _buildMiniPlayerHeartToggle(),
            const SettingsDivider(),
            _buildMiniPlayerRepeatToggle(),
            const SettingsDivider(),
            _buildMiniPlayerShuffleToggle(),
            if (_isDesktop) ...[
              const SettingsDivider(),
              _buildDiscordRpcToggle(),
              const SettingsDivider(),
              _buildDiscordRpcStateStyleSelector(),
              const SettingsDivider(),
              _buildWindowTitlebarToggle(),
            ],
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.homeSection.toUpperCase(),
          children: [
            _buildFavoritePlaylistsOnHomeToggle(),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.liveSearchSection.toUpperCase(),
          children: [
            _buildLiveSearchToggle(),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.artworkSection.toUpperCase(),
          children: [
            _buildArtworkResolutionSelector(),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title:
              AppLocalizations.of(context)!.lyricsDisplaySection.toUpperCase(),
          children: [
            _buildLyricsBlurToggle(),
            const SettingsDivider(),
            _buildLyricsAlignmentSelector(),
            const SettingsDivider(),
            _buildLyricsGlowToggle(),
            const SettingsDivider(),
            _buildLyricsKeepScreenOnToggle(),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(
            context,
          )!
              .smartRecommendations
              .toUpperCase(),
          children: [
            _buildRecommendationsToggle(),
            const SettingsDivider(),
            _buildRecommendationsStats(),
            const SettingsDivider(),
            _buildClearRecommendationsButton(),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildAppearanceEditor() {
    final themeService = Provider.of<ThemeService>(context, listen: false);
    final isDark = context.isDark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEditorRow(
            icon: CupertinoIcons.moon_stars_fill,
            label: AppLocalizations.of(context)!.themeLabel,
            child: _ThemeModeSelector(
              value: _themeMode,
              isDark: isDark,
              onChanged: (mode) async {
                setState(() => _themeMode = mode);
                await themeService.setThemeMode(mode);
              },
            ),
          ),
          const SizedBox(height: 20),
          _buildEditorRow(
            icon: Icons.palette_rounded,
            label: AppLocalizations.of(context)!.accentColorLabel,
            child: OctaveColorSwatches(
              selected: _accentColor,
              onChanged: (color) async {
                setState(() => _accentColor = color);
                await themeService.setAccentColor(color);
              },
            ),
          ),
          const SizedBox(height: 20),
          _buildEditorRow(
            icon: CupertinoIcons.slider_horizontal_3,
            label: AppLocalizations.of(context)!.colorIntensityLabel,
            child: OctaveIntensitySlider(
              value: _intensity,
              onChanged: (value) {
                setState(() => _intensity = value);
                themeService.setIntensity(value);
              },
            ),
          ),
          const SizedBox(height: 12),
          _buildEditorRow(
            icon: CupertinoIcons.circle_fill,
            label: AppLocalizations.of(context)!.pureBlackLabel,
            trailing: Switch(
              value: _pureBlack,
              onChanged: (value) async {
                setState(() => _pureBlack = value);
                await themeService.setPureBlack(value);
              },
            ),
            child: Text(
              AppLocalizations.of(context)!.pureBlackSubtitle,
              style: TextStyle(fontSize: 12, color: context.octave.text2),
            ),
          ),
          if (!_isDesktop) ...[
            const SizedBox(height: 20),
            _buildEditorRow(
              icon: CupertinoIcons.sparkles,
              label: AppLocalizations.of(context)!.circularDesignLabel,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.circularDesignSubtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: context.octave.text2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Spacer(),
                      CupertinoSwitch(
                        value: _liquidGlass,
                        activeTrackColor: context.octave.accent,
                        onChanged: (value) async {
                          setState(() => _liquidGlass = value);
                          await themeService.setLiquidGlass(value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVolumeSliderToggle() {
    return SettingsSwitchTile(
      icon: CupertinoIcons.speaker_2,
      title: AppLocalizations.of(context)!.showVolumeSlider,
      subtitle: AppLocalizations.of(context)!.showVolumeSliderSubtitle,
      value: _showVolumeSlider,
      onChanged: (value) async {
          setState(() => _showVolumeSlider = value);
          await _playerUiSettings.setShowVolumeSlider(value);
        },
    );
  }

  Widget _buildStarRatingsToggle() {
    return SettingsSwitchTile(
      icon: CupertinoIcons.star_fill,
      title: AppLocalizations.of(context)!.showStarRatings,
      subtitle: AppLocalizations.of(context)!.showStarRatingsSubtitle,
      value: _showStarRatings,
      onChanged: (value) async {
          setState(() => _showStarRatings = value);
          await _playerUiSettings.setShowStarRatings(value);
        },
    );
  }

  Widget _buildMiniPlayerHeartToggle() {
    return SettingsSwitchTile(
      icon: CupertinoIcons.heart_fill,
      title: AppLocalizations.of(context)!.showMiniPlayerHeart,
      subtitle: AppLocalizations.of(context)!.showMiniPlayerHeartSubtitle,
      value: _showMiniPlayerHeart,
      onChanged: (value) async {
          setState(() => _showMiniPlayerHeart = value);
          await _playerUiSettings.setShowMiniPlayerHeart(value);
        },
    );
  }

  Widget _buildMiniPlayerRepeatToggle() {
    return SettingsSwitchTile(
      icon: CupertinoIcons.repeat,
      title: AppLocalizations.of(context)!.showMiniPlayerRepeat,
      subtitle: AppLocalizations.of(context)!.showMiniPlayerRepeatSubtitle,
      value: _showMiniPlayerRepeat,
      onChanged: (value) async {
          setState(() => _showMiniPlayerRepeat = value);
          await _playerUiSettings.setShowMiniPlayerRepeat(value);
        },
    );
  }

  Widget _buildMiniPlayerShuffleToggle() {
    return SettingsSwitchTile(
      icon: CupertinoIcons.shuffle,
      title: AppLocalizations.of(context)!.showMiniPlayerShuffle,
      subtitle: AppLocalizations.of(context)!.showMiniPlayerShuffleSubtitle,
      value: _showMiniPlayerShuffle,
      onChanged: (value) async {
          setState(() => _showMiniPlayerShuffle = value);
          await _playerUiSettings.setShowMiniPlayerShuffle(value);
        },
    );
  }

  Widget _buildLiveLyricUnderArtworkToggle() {
    final l10n = AppLocalizations.of(context)!;
    return SettingsSwitchTile(
      icon: CupertinoIcons.quote_bubble_fill,
      title: l10n.lyricsUnderArtwork,
      subtitle: l10n.lyricsUnderArtworkSubtitle,
      value: _showLiveLyricUnderArtwork,
      onChanged: (value) async {
          setState(() => _showLiveLyricUnderArtwork = value);
          await _playerUiSettings.setShowLiveLyricUnderArtwork(value);
        },
    );
  }

  Widget _buildLiveSearchToggle() {
    return SettingsSwitchTile(
      icon: CupertinoIcons.search,
      title: AppLocalizations.of(context)!.liveSearch,
      subtitle: AppLocalizations.of(context)!.liveSearchSubtitle,
      value: _liveSearch,
      onChanged: (value) async {
          setState(() => _liveSearch = value);
          await _playerUiSettings.setLiveSearch(value);
        },
    );
  }

  Widget _buildFavoritePlaylistsOnHomeToggle() {
    return SettingsSwitchTile(
      icon: CupertinoIcons.heart_fill,
      title: AppLocalizations.of(context)!.showFavoritePlaylistsOnHome,
      subtitle: AppLocalizations.of(context)!.showFavoritePlaylistsOnHomeSubtitle,
      value: _showFavoritePlaylistsOnHome,
      onChanged: (value) async {
        setState(() => _showFavoritePlaylistsOnHome = value);
        await _playerUiSettings.setShowFavoritePlaylistsOnHome(value);
      },
    );
  }

  Widget _buildEditorRow({
    required IconData icon,
    required String label,
    required Widget child,
    Widget? trailing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SettingsIconBadge(icon: icon),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                label,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailing != null) ...[const Spacer(), trailing],
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  Widget _buildRecommendationsToggle() {
    return Consumer<RecommendationService>(
      builder: (context, service, _) {
        return SettingsSwitchTile(
      icon: CupertinoIcons.sparkles,
      title: AppLocalizations.of(context)!.enableRecommendations,
      subtitle: AppLocalizations.of(context)!.enableRecommendationsSubtitle,
      value: service.enabled,
      onChanged: (value) => service.setEnabled(value),
    );
      },
    );
  }

  Widget _buildRecommendationsStats() {
    return Consumer<RecommendationService>(
      builder: (context, service, _) {
        final stats = service.getListeningStats();
        final uniqueSongs = stats['uniqueSongs'] ?? 0;
        final totalPlays = stats['totalPlays'] ?? 0;
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          title: Text(
            AppLocalizations.of(context)!.listeningData,
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            AppLocalizations.of(context)!.totalPlays(totalPlays),
            style: TextStyle(
              fontSize: 13,
              color: context.octave.text2,
            ),
          ),
          trailing: Text(
            AppLocalizations.of(context)!.songsCount(uniqueSongs),
            style: TextStyle(
              fontSize: 14,
              color: context.octave.text2,
            ),
          ),
        );
      },
    );
  }

  Widget _buildClearRecommendationsButton() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(
        AppLocalizations.of(context)!.clearListeningHistory,
        style: TextStyle(fontSize: 16, color: context.octave.danger),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.clearListeningHistory),
            content: Text(AppLocalizations.of(context)!.confirmClearHistory),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Provider.of<RecommendationService>(
                    context,
                    listen: false,
                  ).clearData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context)!.historyCleared,
                      ),
                    ),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.delete,
                  style: TextStyle(color: context.octave.danger),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDiscordRpcToggle() {
    return Consumer<PlayerProvider>(
      builder: (context, player, _) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF5865F2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              CupertinoIcons.game_controller,
              color: Colors.white,
              size: 18,
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.discordStatus,
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            AppLocalizations.of(context)!.discordStatusSubtitle,
            style: TextStyle(
              fontSize: 13,
              color: context.octave.text2,
            ),
          ),
          trailing: CupertinoSwitch(
            value: player.discordRpcEnabled,
            activeTrackColor: Theme.of(context).colorScheme.primary,
            onChanged: (value) async {
              await player.setDiscordRpcEnabled(value);

              setState(() {});
            },
          ),
        );
      },
    );
  }

  Widget _buildDiscordRpcStateStyleSelector() {
    final l10n = AppLocalizations.of(context)!;
    final styles = [
      ('artist', l10n.discordRpcStyleArtist),
      ('song_title', l10n.discordRpcStyleSong),
      ('app_name', l10n.discordRpcStyleApp),
    ];
    return Consumer<PlayerProvider>(
      builder: (context, player, _) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF5865F2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              CupertinoIcons.text_bubble,
              color: Colors.white,
              size: 18,
            ),
          ),
          title: Text(l10n.discordStatusText,
              style: const TextStyle(fontSize: 16)),
          subtitle: Text(
            l10n.discordStatusTextSubtitle,
            style: TextStyle(
              fontSize: 13,
              color: context.octave.text2,
            ),
          ),
          trailing: DropdownButton<String>(
            value: player.discordRpcStateStyle,
            underline: const SizedBox.shrink(),
            items: styles
                .map(
                  (s) => DropdownMenuItem(
                    value: s.$1,
                    child: Text(s.$2, style: const TextStyle(fontSize: 14)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) player.setDiscordRpcStateStyle(value);
            },
          ),
        );
      },
    );
  }

  Widget _buildLanguageSelector() {
    return Consumer<LocaleService>(
      builder: (context, localeService, _) {
        final currentLocale = localeService.currentLocale;
        final String currentLanguageName;

        if (currentLocale == null) {
          final resolvedLocale = Localizations.localeOf(context);
          final systemName =
              LocaleService.supportedLanguages[resolvedLocale.languageCode] ??
                  resolvedLocale.languageCode.toUpperCase();
          final defaultLabel =
              AppLocalizations.of(context)?.systemDefault ?? 'System Default';
          currentLanguageName = '$defaultLabel ($systemName)';
        } else {
          final currentLanguageCode = currentLocale.languageCode;
          currentLanguageName =
              LocaleService.supportedLanguages[currentLanguageCode] ??
                  currentLanguageCode.toUpperCase();
        }

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: SettingsIconBadge(
            icon: CupertinoIcons.globe,
          ),
          title: Text(
            AppLocalizations.of(context)!.language,
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            currentLanguageName,
            style: TextStyle(
              fontSize: 13,
              color: context.octave.text2,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, size: 20),
          onTap: () => _showLanguagePicker(context, localeService),
        );
      },
    );
  }

  Widget _buildTranslationCredit() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: context.octave.accent.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          CupertinoIcons.heart_fill,
          color: context.octave.accent,
          size: 18,
        ),
      ),
      title: Text(
        AppLocalizations.of(context)!.communityTranslations,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        AppLocalizations.of(context)!.communityTranslationsSubtitle,
        style: TextStyle(
          fontSize: 13,
          color: context.octave.text2,
        ),
      ),
      trailing: const Icon(Icons.open_in_new_rounded, size: 18),
      onTap: () => _launchUrl('https://github.com/CharlesDuchaussoy/Octave/tree/master/lib/l10n'),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showLanguagePicker(BuildContext context, LocaleService localeService) {
    final resolvedLocale = Localizations.localeOf(context);
    final systemLangName =
        LocaleService.supportedLanguages[resolvedLocale.languageCode] ??
            resolvedLocale.languageCode.toUpperCase();
    final systemPercentage =
        LocaleService.getCompletionPercentage(resolvedLocale.languageCode);

    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: context.octave.surface1,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 4),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.octave.text3,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
              child: Row(
                children: [
                  const Icon(CupertinoIcons.globe, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.selectLanguage,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          AppLocalizations.of(context)
                                  ?.communityTranslationsSubtitle ??
                              'Translations are provided by the community on Crowdin',
                          style: TextStyle(
                            fontSize: 12,
                            color: context.octave.text2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(CupertinoIcons.device_phone_portrait),
              title: Text(AppLocalizations.of(context)!.systemDefault),
              subtitle: Text(
                '$systemLangName • $systemPercentage%',
                style: TextStyle(
                  fontSize: 12,
                  color: context.octave.text2,
                ),
              ),
              trailing: localeService.currentLocale == null
                  ? Icon(Icons.check,
                      color: Theme.of(context).colorScheme.primary)
                  : null,
              onTap: () {
                localeService.setLocale(null);
                Navigator.pop(context);
              },
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                children: LocaleService.supportedLanguages.entries.map((entry) {
                  final isSelected =
                      localeService.currentLocale?.languageCode == entry.key;
                  final percentage =
                      LocaleService.getCompletionPercentage(entry.key);
                  return ListTile(
                    leading: Text(
                      _getFlagEmoji(entry.key),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(entry.value),
                    subtitle: Text(
                      '$percentage%',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: percentage >= 80
                            ? context.octave.accent
                            : (percentage >= 40
                                ? context.octave.accent
                                : (context.octave.text2)),
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check,
                            color: Theme.of(context).colorScheme.primary)
                        : null,
                    onTap: () {
                      localeService.setLocale(Locale(entry.key));
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFlagEmoji(String languageCode) {
    return LocaleService.getFlagEmoji(languageCode);
  }

  Widget _buildLyricsBlurToggle() {
    final l10n = AppLocalizations.of(context)!;
    return SwitchListTile.adaptive(
      title: Text(l10n.lyricsBlurUnfocused),
      subtitle: Text(l10n.lyricsBlurUnfocusedSubtitle),
      value: _lyricsBlurUnfocused,
      onChanged: (val) async {
        await _playerUiSettings.setLyricsBlurUnfocused(val);
        setState(() => _lyricsBlurUnfocused = val);
      },
    );
  }

  Widget _buildArtworkResolutionSelector() {
    final options = {
      'low': AppLocalizations.of(context)!.artworkResLow,
      'normal': AppLocalizations.of(context)!.artworkResNormal,
      'high': AppLocalizations.of(context)!.artworkResHigh,
    };
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(AppLocalizations.of(context)!.artworkResolution),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _artworkResolution,
          items: options.entries.map((e) {
            return DropdownMenuItem(
              value: e.key,
              child: Text(e.value),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) {
              setState(() => _artworkResolution = val);
              _playerUiSettings.setArtworkResolution(val);
              ImageUrlCache.clear();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLyricsAlignmentSelector() {
    final l10n = AppLocalizations.of(context)!;
    return ListTile(
      title: Text(l10n.lyricsAlignment),
      subtitle: Text(_lyricsAlignment == 'center'
          ? l10n.lyricsAlignmentCentered
          : l10n.lyricsAlignmentLeft),
      trailing: SegmentedButton<String>(
        segments: [
          ButtonSegment(
              value: 'left',
              label: Text(l10n.alignLeft),
              icon: const Icon(Icons.format_align_left, size: 16)),
          ButtonSegment(
              value: 'center',
              label: Text(l10n.alignCenter),
              icon: const Icon(Icons.format_align_center, size: 16)),
        ],
        selected: {_lyricsAlignment},
        onSelectionChanged: (val) async {
          final chosen = val.first;
          await _playerUiSettings.setLyricsAlignment(chosen);
          setState(() => _lyricsAlignment = chosen);
        },
      ),
    );
  }

  Widget _buildLyricsGlowToggle() {
    final l10n = AppLocalizations.of(context)!;
    return SwitchListTile.adaptive(
      title: Text(l10n.lyricsGlowEffect),
      subtitle: Text(l10n.lyricsGlowEffectSubtitle),
      value: _lyricsGlowEffect,
      onChanged: (val) async {
        await _playerUiSettings.setLyricsGlowEffect(val);
        setState(() => _lyricsGlowEffect = val);
      },
    );
  }

  Widget _buildLyricsKeepScreenOnToggle() {
    final l10n = AppLocalizations.of(context)!;
    return SwitchListTile.adaptive(
      title: Text(l10n.lyricsKeepScreenOn),
      subtitle: Text(l10n.lyricsKeepScreenOnSubtitle),
      value: _lyricsKeepScreenOn,
      onChanged: (val) async {
        await _playerUiSettings.setLyricsKeepScreenOn(val);
        setState(() => _lyricsKeepScreenOn = val);
      },
    );
  }

  Widget _buildWindowTitlebarToggle() {
    final l10n = AppLocalizations.of(context)!;
    return SwitchListTile.adaptive(
      title: Text(l10n.hideWindowTitlebar),
      subtitle: Text(l10n.hideWindowTitlebarSubtitle),
      value: _hideWindowTitlebar,
      onChanged: (val) async {
        await StorageService().saveHideWindowTitlebar(val);
        setState(() => _hideWindowTitlebar = val);
        if (_isDesktop) {
          try {
            await windowManager.setTitleBarStyle(
                val ? TitleBarStyle.hidden : TitleBarStyle.normal);
          } catch (_) {}
        }
      },
    );
  }
}

class _ThemeModeSelector extends StatelessWidget {
  const _ThemeModeSelector({
    required this.value,
    required this.isDark,
    required this.onChanged,
  });

  final ThemeMode value;
  final bool isDark;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final options = [
      (
        mode: ThemeMode.system,
        label: AppLocalizations.of(context)!.themeModeSystem,
        icon: CupertinoIcons.device_phone_portrait
      ),
      (
        mode: ThemeMode.light,
        label: AppLocalizations.of(context)!.themeModeLight,
        icon: CupertinoIcons.sun_max_fill
      ),
      (
        mode: ThemeMode.dark,
        label: AppLocalizations.of(context)!.themeModeDark,
        icon: CupertinoIcons.moon_fill
      ),
    ];

    final colors = context.octave;

    return Row(
      children: options.map((opt) {
        final selected = value == opt.mode;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(opt.mode),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.only(right: 6),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: selected ? colors.accent : colors.surface2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    opt.icon,
                    size: 18,
                    color: selected ? colors.onAccent : colors.text2,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    opt.label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                      color: selected ? colors.onAccent : colors.text2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
