import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/player_provider.dart';
import '../../services/subsonic_service.dart';
import '../../services/update_service.dart';
import '../../widgets/settings/settings_section_card.dart';
import '../theme/octave_theme.dart';
import '../widgets/scroll_end_padding.dart';
import 'app_log.dart';
import 'problem_report.dart';

/// "Report a problem": a short form sent to the server, which shows it on
/// its owner's management page. A server without the "octoReportProblem"
/// extension gets a filled GitHub issue page instead.
class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  static Future<void> open(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ReportProblemScreen()),
    );
  }

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  final _message = TextEditingController();
  ProblemKind _kind = ProblemKind.bug;
  bool _includeDetails = true;
  bool _sending = false;

  /// Null while the server is asked.
  bool? _serverTakesReports;

  @override
  void initState() {
    super.initState();
    _message.addListener(() => setState(() {}));
    _checkServer();
  }

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  Future<void> _checkServer() async {
    final subsonic = context.read<SubsonicService>();
    final takes = subsonic.config != null &&
        (await subsonic.openSubsonicExtensions())
            .contains('octoReportProblem');
    if (mounted) setState(() => _serverTakesReports = takes);
  }

  ProblemReport _report() {
    final subsonic = context.read<SubsonicService>();
    final player = context.read<PlayerProvider>();
    return ProblemReport(
      kind: _kind,
      message: _message.text.trim(),
      appVersion: UpdateService.currentVersion,
      platform: kIsWeb ? 'web' : Platform.operatingSystem,
      osVersion: kIsWeb ? '' : Platform.operatingSystemVersion,
      songId: _includeDetails ? player.currentSong?.id : null,
      log: _includeDetails
          ? cleanLog(AppLog.lines, serverUrl: subsonic.config?.serverUrl)
          : null,
    );
  }

  Future<void> _send() async {
    final l10n = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final report = _report();

    if (_serverTakesReports != true) {
      await launchUrl(report.gitHubIssueUrl(),
          mode: LaunchMode.externalApplication);
      return;
    }

    setState(() => _sending = true);
    try {
      await context.read<SubsonicService>().octoReportProblem(report.toFields());
      messenger.showSnackBar(SnackBar(content: Text(l10n.reportSent)));
      navigator.pop();
    } catch (e) {
      final reason = e.toString().replaceFirst('Exception: ', '');
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.reportSendFailed(reason))),
      );
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.octave;
    final canSend = _message.text.trim().isNotEmpty &&
        _serverTakesReports != null &&
        !_sending;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(l10n.aboutLinkReportIssue),
        centerTitle: false,
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 8, 16, scrollEndPadding(context)),
        children: [
          SegmentedButton<ProblemKind>(
            segments: [
              ButtonSegment(
                value: ProblemKind.bug,
                label: Text(l10n.reportKindBug),
              ),
              ButtonSegment(
                value: ProblemKind.idea,
                label: Text(l10n.reportKindIdea),
              ),
            ],
            selected: {_kind},
            showSelectedIcon: false,
            onSelectionChanged: (kinds) => setState(() => _kind = kinds.first),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _message,
            minLines: 5,
            maxLines: 10,
            maxLength: ProblemReport.maxMessageLength,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: _kind == ProblemKind.bug
                  ? l10n.reportMessageHintBug
                  : l10n.reportMessageHintIdea,
              filled: true,
              fillColor: colors.surface1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (_serverTakesReports != false)
            SettingsSectionCard(
              children: [
                SwitchListTile(
                  value: _includeDetails,
                  onChanged: (value) => setState(() => _includeDetails = value),
                  title: Text(l10n.reportIncludeDetails),
                  subtitle: Text(
                    l10n.reportIncludeDetailsSubtitle,
                    style: TextStyle(fontSize: 13, color: colors.text2),
                  ),
                ),
              ],
            )
          else
            Text(
              l10n.reportGitHubNote,
              style: TextStyle(fontSize: 13, color: colors.text2),
            ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: canSend ? _send : null,
            child: _sending
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(_serverTakesReports == false
                    ? l10n.reportOpenGitHub
                    : l10n.reportSend),
          ),
        ],
      ),
    );
  }
}
