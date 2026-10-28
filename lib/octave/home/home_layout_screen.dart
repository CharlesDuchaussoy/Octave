import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../theme/octave_theme.dart';
import '../widgets/scroll_end_padding.dart';
import 'home_layout.dart';

/// "Customize home": drag the rows into the order you like, and hide
/// the ones you do not use.
class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  static String sectionName(AppLocalizations l10n, HomeSection section) =>
      switch (section) {
        HomeSection.quickAccess => l10n.homeSectionQuickAccess,
        HomeSection.favoritePlaylists => l10n.homeSectionFavoritePlaylists,
        HomeSection.jumpBackIn => l10n.homeJumpBackIn,
        HomeSection.madeForYou => l10n.madeForYou,
        HomeSection.listenAgain => l10n.homeListenAgain,
        HomeSection.topHits => l10n.homeTopHits,
        HomeSection.playlists => l10n.yourPlaylists,
        HomeSection.mixes => l10n.homeSectionMixes,
        HomeSection.artists => l10n.homeArtistsYouLove,
      };

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    final layout = HomeLayout.instance;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(l10n.customizeHome),
        ),
        centerTitle: false,
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListenableBuilder(
        listenable: layout,
        builder: (context, _) {
          final order = layout.order;
          return ListView(
            padding: EdgeInsets.only(bottom: scrollEndPadding(context)),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                child: Text(
                  l10n.customizeHomeHint,
                  style: TextStyle(fontSize: 14, color: colors.text2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  color: colors.surface1,
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.antiAlias,
                  child: ReorderableListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    buildDefaultDragHandles: false,
                    onReorderItem: layout.move,
                    children: [
                      for (final (index, section) in order.indexed)
                        ListTile(
                          key: ValueKey(section),
                          leading: ReorderableDragStartListener(
                            index: index,
                            child: Icon(
                              CupertinoIcons.line_horizontal_3,
                              color: colors.text3,
                            ),
                          ),
                          title: Text(
                            sectionName(l10n, section),
                            style: TextStyle(
                              color: layout.isVisible(section)
                                  ? colors.text1
                                  : colors.text3,
                            ),
                          ),
                          trailing: Switch.adaptive(
                            value: layout.isVisible(section),
                            onChanged: (v) => layout.setVisible(section, v),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: layout.reset,
                  child: Text(l10n.customizeHomeReset),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
