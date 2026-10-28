import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/octave/report/report_problem_screen.dart';
import 'settings_playback_tab.dart';
import 'settings_storage_tab.dart';
import 'settings_server_tab.dart';
import 'settings_display_tab.dart';
import 'settings_about_tab.dart';
import 'settings_android_auto_tab.dart';
import 'package:musly/octave/widgets/scroll_end_padding.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/widgets/settings/settings_list_tile.dart';
import 'package:musly/widgets/settings/settings_section_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  bool get _isDesktop {
    if (kIsWeb) return false;
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final tabs = [
      (icon: CupertinoIcons.play_circle, text: l10n.tabPlayback),
      (icon: CupertinoIcons.folder, text: l10n.tabStorage),
      (icon: CupertinoIcons.cloud, text: l10n.tabServer),
      (icon: CupertinoIcons.paintbrush, text: l10n.tabDisplay),
      (icon: CupertinoIcons.car_detailed, text: l10n.tabAndroidAuto),
      (icon: CupertinoIcons.info, text: l10n.tabAbout),
    ];

    final tabViews = const [
      SettingsPlaybackTab(),
      SettingsStorageTab(),
      SettingsServerTab(),
      SettingsDisplayTab(),
      SettingsAndroidAutoTab(),
      SettingsAboutTab(),
    ];

    if (_isDesktop) {
      return Scaffold(
        backgroundColor:
            context.octave.background,
        appBar: AppBar(
          title: Text(l10n.settingsTitle),
          centerTitle: false,
          backgroundColor:
              context.octave.background,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        body: Row(
          children: [
            Container(
              width: 250,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: tabs.length + 1,
                itemBuilder: (context, index) {
                  if (index == tabs.length) {
                    return ListTile(
                      leading: Icon(
                        CupertinoIcons.exclamationmark_bubble,
                        color: context.octave.text2,
                      ),
                      title: Text(l10n.aboutLinkReportIssue),
                      onTap: () => ReportProblemScreen.open(context),
                    );
                  }
                  final isSelected = _selectedIndex == index;
                  return ListTile(
                    leading: Icon(
                      tabs[index].icon,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : (context.octave.text2),
                    ),
                    title: Text(
                      tabs[index].text,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : (context.octave.text1),
                      ),
                    ),
                    selected: isSelected,
                    selectedTileColor: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.1),
                    onTap: () {
                      setState(() => _selectedIndex = index);
                      _tabController.animateTo(index);
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: tabViews
                    .map((v) => Center(
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: v)))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    // Phones: one grouped list, as in the iOS Settings app. Each row
    // opens its page, so the six sections never have to share a tab bar.
    void open(int index) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => _SettingsPage(
            title: tabs[index].text,
            child: tabViews[index],
          ),
        ),
      );
    }

    Widget row(int index) => SettingsListTile(
          icon: tabs[index].icon,
          title: tabs[index].text,
          trailing: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              CupertinoIcons.chevron_forward,
              size: 18,
              color: context.octave.text3,
            ),
          ),
          onTap: () => open(index),
        );

    final showAndroidAuto = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    return Scaffold(
      backgroundColor: context.octave.background,
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        centerTitle: false,
        backgroundColor: context.octave.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 8, bottom: scrollEndPadding(context)),
        children: [
          SettingsSectionCard(
            children: [
              row(3),
              const SettingsDivider(),
              row(0),
              const SettingsDivider(),
              row(1),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSectionCard(
            children: [
              row(2),
              if (showAndroidAuto) ...[
                const SettingsDivider(),
                row(4),
              ],
            ],
          ),
          const SizedBox(height: 24),
          SettingsSectionCard(
            children: [
              row(5),
              const SettingsDivider(),
              SettingsListTile(
                icon: CupertinoIcons.exclamationmark_bubble,
                title: l10n.aboutLinkReportIssue,
                trailing: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    CupertinoIcons.chevron_forward,
                    size: 18,
                    color: context.octave.text3,
                  ),
                ),
                onTap: () => ReportProblemScreen.open(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// One settings section opened from the list.
class _SettingsPage extends StatelessWidget {
  const _SettingsPage({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.octave.background,
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
        backgroundColor: context.octave.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: child,
    );
  }
}
