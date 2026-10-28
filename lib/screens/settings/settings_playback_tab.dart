import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/services/replay_gain_service.dart';
import 'package:musly/services/auto_dj_service.dart';
import 'package:musly/services/transcoding_service.dart';
import 'package:musly/services/fade_settings_service.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/widgets/settings/settings_section_card.dart';
import 'package:musly/widgets/settings/settings_switch_tile.dart';
import 'package:musly/widgets/settings/settings_list_tile.dart';
import 'package:musly/widgets/settings/settings_icon_badge.dart';

import 'package:musly/services/crossfade_service.dart';
import 'package:musly/octave/widgets/scroll_end_padding.dart';

class SettingsPlaybackTab extends StatefulWidget {
  const SettingsPlaybackTab({super.key});

  @override
  State<SettingsPlaybackTab> createState() => _SettingsPlaybackTabState();
}

class _SettingsPlaybackTabState extends State<SettingsPlaybackTab> {
  final _replayGainService = ReplayGainService();
  final _fadeSettingsService = FadeSettingsService();
  final _crossfadeService = CrossfadeService();

  ReplayGainMode _replayGainMode = ReplayGainMode.off;
  double _replayGainPreamp = 0.0;
  bool _replayGainPreventClipping = true;
  double _replayGainFallback = -6.0;
  AutoDjMode _autoDjMode = AutoDjMode.off;
  int _autoDjSongsToAdd = 5;
  bool _fadeEnabled = false;
  int _fadeDurationMs = 300;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    await _replayGainService.initialize();
    await _fadeSettingsService.initialize();
    await _crossfadeService.initialize();

    setState(() {
      _replayGainMode = _replayGainService.getMode();
      _replayGainPreamp = _replayGainService.getPreampGain();
      _replayGainPreventClipping = _replayGainService.getPreventClipping();
      _replayGainFallback = _replayGainService.getFallbackGain();
      _autoDjMode = playerProvider.autoDjService.mode;
      _autoDjSongsToAdd = playerProvider.autoDjService.songsToAdd;
      _fadeEnabled = _fadeSettingsService.getFadeEnabled();
      _fadeDurationMs = _fadeSettingsService.getFadeDurationMs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 16, bottom: scrollEndPadding(context)),
      children: [
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionAutoDj,
          children: [
            _buildAutoDjModeSelector(),
            if (_autoDjMode != AutoDjMode.off) ...[
              const SettingsDivider(),
              _buildAutoDjSongsSlider(),
            ],
          ],
        ),
        const SizedBox(height: 24),
        _buildCrossfadeSection(),
        const SizedBox(height: 24),
        _buildFadeSection(),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionVolumeNormalization,
          children: [
            _buildReplayGainModeSelector(),
            if (_replayGainMode != ReplayGainMode.off) ...[
              const SettingsDivider(),
              _buildReplayGainPreampSlider(),
              const SettingsDivider(),
              _buildReplayGainClippingToggle(),
              const SettingsDivider(),
              _buildReplayGainFallbackSlider(),
            ],
          ],
        ),
        const SizedBox(height: 24),
        _buildTranscodingSection(),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildAutoDjModeSelector() {
    return SettingsListTile(
      icon: CupertinoIcons.wand_stars,
      title: AppLocalizations.of(context)!.autoDjMode,
      trailing: DropdownButton<AutoDjMode>(
        value: _autoDjMode,
        underline: const SizedBox(),
        isDense: true,
        isExpanded: true,
        items: AutoDjMode.values.map((mode) {
          return DropdownMenuItem(
            value: mode,
            child: Text(
              _getAutoDjModeLabel(mode),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) _setAutoDjMode(value);
        },
      ),
    );
  }

  String _getAutoDjModeLabel(AutoDjMode mode) {
    final l10n = AppLocalizations.of(context)!;
    return switch (mode) {
      AutoDjMode.off => l10n.autoDjOff,
      AutoDjMode.shuffleLibrary => l10n.autoDjShuffleLibrary,
      AutoDjMode.similarSongs => l10n.autoDjSimilarSongs,
      AutoDjMode.sameGenre => l10n.autoDjSameGenre,
      AutoDjMode.sameArtist => l10n.autoDjSameArtist,
      AutoDjMode.smartMix => l10n.autoDjSmartMix,
    };
  }

  void _setAutoDjMode(AutoDjMode mode) {
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    playerProvider.autoDjService.setMode(mode);
    setState(() => _autoDjMode = mode);
  }

  Widget _buildAutoDjSongsSlider() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: SettingsIconBadge(
        icon: CupertinoIcons.music_note_list,
      ),
      title: Text(
        AppLocalizations.of(context)!.autoDjSongsToAdd(_autoDjSongsToAdd),
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Slider(
        value: _autoDjSongsToAdd.toDouble(),
        min: 1,
        max: 20,
        divisions: 19,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (value) {
          final count = value.round();
          final playerProvider = Provider.of<PlayerProvider>(
            context,
            listen: false,
          );
          playerProvider.autoDjService.setSongsToAdd(count);
          setState(() => _autoDjSongsToAdd = count);
        },
      ),
    );
  }

  Widget _buildReplayGainModeSelector() {
    return SettingsListTile(
      icon: CupertinoIcons.speaker_2,
      title: AppLocalizations.of(context)!.replayGainMode,
      trailing: DropdownButton<ReplayGainMode>(
        value: _replayGainMode,
        underline: const SizedBox(),
        items: ReplayGainMode.values.map((mode) {
          return DropdownMenuItem(
            value: mode,
            child: Text(_getReplayGainModeLabel(mode)),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) _setReplayGainMode(value);
        },
      ),
    );
  }

  String _getReplayGainModeLabel(ReplayGainMode mode) {
    final l10n = AppLocalizations.of(context)!;
    switch (mode) {
      case ReplayGainMode.off:
        return l10n.replayGainModeOff;
      case ReplayGainMode.track:
        return l10n.replayGainModeTrack;
      case ReplayGainMode.album:
        return l10n.replayGainModeAlbum;
    }
  }

  void _setReplayGainMode(ReplayGainMode mode) async {
    await _replayGainService.setMode(mode);
    setState(() => _replayGainMode = mode);
  }

  Widget _buildReplayGainPreampSlider() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(AppLocalizations.of(context)!
          .replayGainPreamp(_replayGainPreamp.toStringAsFixed(1))),
      subtitle: Slider(
        value: _replayGainPreamp,
        min: -12,
        max: 12,
        divisions: 24,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (value) async {
          await _replayGainService.setPreampGain(value);
          setState(() => _replayGainPreamp = value);
        },
      ),
    );
  }

  Widget _buildReplayGainClippingToggle() {
    return SettingsSwitchTile(
      title: AppLocalizations.of(context)!.replayGainPreventClipping,
      value: _replayGainPreventClipping,
      onChanged: (value) async {
        await _replayGainService.setPreventClipping(value);
        setState(() => _replayGainPreventClipping = value);
      },
    );
  }

  Widget _buildReplayGainFallbackSlider() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(
        AppLocalizations.of(context)!
            .replayGainFallbackGain(_replayGainFallback.toStringAsFixed(1)),
      ),
      subtitle: Slider(
        value: _replayGainFallback,
        min: -12,
        max: 0,
        divisions: 12,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (value) async {
          await _replayGainService.setFallbackGain(value);
          setState(() => _replayGainFallback = value);
        },
      ),
    );
  }

  Widget _buildCrossfadeSection() {
    final accent = Theme.of(context).colorScheme.primary;
    final l10n = AppLocalizations.of(context)!;
    final crossfadeSec = _crossfadeService.getCrossfadeSeconds();

    return SettingsSectionCard(
      title: l10n.sectionSmartCrossfade,
      children: [
        SettingsListTile(
          icon: CupertinoIcons.slider_horizontal_below_rectangle,
          title: l10n.trackCrossfade,
          subtitle: crossfadeSec == 0
              ? l10n.crossfadeOffSubtitle
              : l10n.crossfadeDurationSubtitle(crossfadeSec),
          trailing: Text(
            crossfadeSec == 0
                ? l10n.replayGainModeOff
                : l10n.crossfadeDurationBadge(crossfadeSec),
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: accent),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                value: crossfadeSec.toDouble(),
                min: 0,
                max: 12,
                divisions: 12,
                activeColor: accent,
                onChanged: (value) async {
                  final sec = value.round();
                  await _crossfadeService.setCrossfadeSeconds(sec);
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.replayGainModeOff,
                      style: TextStyle(
                          fontSize: 12,
                          color: context.octave.text3)),
                  Text(l10n.crossfadeDurationBadge(6),
                      style: TextStyle(
                          fontSize: 12,
                          color: context.octave.text3)),
                  Text(l10n.crossfadeDurationBadge(12),
                      style: TextStyle(
                          fontSize: 12,
                          color: context.octave.text3)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFadeSection() {
    final l10n = AppLocalizations.of(context)!;
    return SettingsSectionCard(
      title: l10n.sectionFadeInOut,
      children: [
        SettingsSwitchTile(
          icon: CupertinoIcons.waveform,
          title: l10n.fadeInOutEnable,
          subtitle: l10n.fadeInOutSubtitle,
          value: _fadeEnabled,
          onChanged: (v) async {
            await _fadeSettingsService.setFadeEnabled(v);
            setState(() => _fadeEnabled = v);
          },
        ),
        if (_fadeEnabled) ...[
          const SettingsDivider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            title: Text(
              l10n.fadeDuration(_fadeDurationMs),
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Slider(
              value: _fadeDurationMs.toDouble(),
              min: 100,
              max: 1000,
              divisions: 18,
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged: (value) async {
                final duration = value.round();
                await _fadeSettingsService.setFadeDurationMs(duration);
                setState(() => _fadeDurationMs = duration);
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTranscodingSection() {
    return Consumer<TranscodingService>(
      builder: (context, ts, _) {
        final secondaryText = context.octave.text2;

        Widget connectionBadge() {
          final isWifi = ts.currentConnectionType == ConnectionType.wifi;
          final l10n = AppLocalizations.of(context)!;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: (isWifi ? context.octave.success : context.octave.warning)
                  .withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isWifi ? Icons.wifi_rounded : Icons.signal_cellular_alt,
                  size: 12,
                  color: isWifi ? context.octave.success : context.octave.warning,
                ),
                const SizedBox(width: 4),
                Text(
                  isWifi ? l10n.networkWifi : l10n.networkMobile,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isWifi ? context.octave.success : context.octave.warning,
                  ),
                ),
              ],
            ),
          );
        }

        return SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionStreamingQuality,
          children: [
            SettingsSwitchTile(
              icon: CupertinoIcons.waveform,
              title: AppLocalizations.of(context)!.transcodingEnable,
              subtitle: AppLocalizations.of(context)!.transcodingEnableSubtitle,
              value: ts.enabled,
              onChanged: (v) => ts.setEnabled(v),
            ),
            if (ts.enabled) ...[
              const SettingsDivider(),
              SettingsSwitchTile(
                icon: Icons.auto_fix_high_rounded,
                title: AppLocalizations.of(context)!.smartTranscoding,
                subtitle: AppLocalizations.of(context)!.smartTranscodingSubtitle,
                value: ts.smartEnabled,
                onChanged: (v) => ts.setSmartEnabled(v),
              ),
              if (ts.smartEnabled)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!
                              .smartTranscodingDetectedNetwork,
                          style: TextStyle(fontSize: 12, color: secondaryText),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      connectionBadge(),
                      const Spacer(),
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!
                              .smartTranscodingActiveBitrate(
                            ts.getCurrentBitrate() != null
                                ? '${ts.getCurrentBitrate()} kbps'
                                : AppLocalizations.of(context)!
                                    .transcodingFormatOriginal,
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              const SettingsDivider(),
              SettingsListTile(
                leading: const Icon(Icons.wifi_rounded, size: 20),
                title: AppLocalizations.of(context)!.transcodingWifiQuality,
                subtitle: ts.smartEnabled
                    ? AppLocalizations.of(context)!
                        .transcodingWifiQualitySubtitleSmart
                    : AppLocalizations.of(context)!
                        .transcodingWifiQualitySubtitle,
                trailing: DropdownButton<int>(
                  value: ts.wifiBitrate,
                  underline: const SizedBox(),
                  items: TranscodeBitrate.options.map((bitrate) {
                    final label = bitrate == TranscodeBitrate.original
                        ? AppLocalizations.of(context)!
                            .transcodingBitrateOriginal
                        : '$bitrate kbps';
                    return DropdownMenuItem(value: bitrate, child: Text(label));
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) ts.setWifiBitrate(v);
                  },
                ),
              ),
              const SettingsDivider(),
              SettingsListTile(
                leading: const Icon(
                  Icons.signal_cellular_alt_rounded,
                  size: 20,
                ),
                title: AppLocalizations.of(context)!.transcodingMobileQuality,
                subtitle: ts.smartEnabled
                    ? AppLocalizations.of(context)!
                        .transcodingMobileQualitySubtitleSmart
                    : AppLocalizations.of(context)!
                        .transcodingMobileQualitySubtitle,
                trailing: DropdownButton<int>(
                  value: ts.mobileBitrate,
                  underline: const SizedBox(),
                  items: TranscodeBitrate.options.map((bitrate) {
                    final label = bitrate == TranscodeBitrate.original
                        ? AppLocalizations.of(context)!
                            .transcodingBitrateOriginal
                        : '$bitrate kbps';
                    return DropdownMenuItem(value: bitrate, child: Text(label));
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) ts.setMobileBitrate(v);
                  },
                ),
              ),
              const SettingsDivider(),
              SettingsListTile(
                leading: const Icon(Icons.audio_file_rounded, size: 20),
                title: AppLocalizations.of(context)!.transcodingFormat,
                subtitle: AppLocalizations.of(context)!.transcodingFormatSubtitle,
                trailing: DropdownButton<String>(
                  value: ts.format,
                  underline: const SizedBox(),
                  items: TranscodeFormat.options.map((format) {
                    final label = format == TranscodeFormat.original
                        ? AppLocalizations.of(context)!
                            .transcodingFormatOriginal
                        : format.toUpperCase();
                    return DropdownMenuItem(value: format, child: Text(label));
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) ts.setFormat(v);
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
