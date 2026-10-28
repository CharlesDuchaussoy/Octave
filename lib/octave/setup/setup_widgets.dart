import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../theme/octave_theme.dart';

/// Layout shared by every setup step: progress, back and skip at the top,
/// one title and one sentence, the step content, one main button.
class SetupScaffold extends StatelessWidget {
  const SetupScaffold({
    super.key,
    required this.title,
    required this.primaryLabel,
    required this.onPrimary,
    this.body,
    this.child,
    this.progress,
    this.onBack,
    this.onSkip,
    this.secondaryLabel,
    this.onSecondary,
  });

  final String title;
  final String? body;
  final Widget? child;

  /// From 0 to 1; hidden when null.
  final double? progress;
  final VoidCallback? onBack;
  final VoidCallback? onSkip;
  final String primaryLabel;
  final VoidCallback? onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (progress != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(end: progress),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        builder: (context, value, _) =>
                            LinearProgressIndicator(value: value, minHeight: 3),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 56,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      if (onBack != null)
                        IconButton(
                          tooltip: l10n.setupBack,
                          icon: const Icon(Icons.arrow_back_rounded),
                          onPressed: onBack,
                        ),
                      const Spacer(),
                      if (onSkip != null)
                        TextButton(
                          onPressed: onSkip,
                          style: TextButton.styleFrom(
                            foregroundColor: colors.text2,
                          ),
                          child: Text(l10n.setupSkip),
                        ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          title,
                          style: textTheme.displayMedium?.copyWith(
                            fontSize: 30,
                            height: 1.15,
                          ),
                        ),
                        if (body != null) ...[
                          const SizedBox(height: 10),
                          Text(
                            body!,
                            style: textTheme.bodyLarge?.copyWith(
                              color: colors.text2,
                              fontSize: 16,
                              height: 1.4,
                            ),
                          ),
                        ],
                        if (child != null) ...[
                          const SizedBox(height: 28),
                          child!,
                        ],
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 52,
                        child: FilledButton(
                          onPressed: onPrimary,
                          style: FilledButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(primaryLabel),
                        ),
                      ),
                      if (secondaryLabel != null) ...[
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: onSecondary,
                          style: TextButton.styleFrom(
                            foregroundColor: colors.text2,
                            minimumSize: const Size.fromHeight(44),
                          ),
                          child: Text(secondaryLabel!),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A selectable row: title, optional description, a radio mark on the
/// right. The recommended choice says so in plain text.
class SetupChoiceTile extends StatelessWidget {
  const SetupChoiceTile({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.subtitle,
    this.icon,
    this.leading,
    this.recommended = false,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;

  /// Shown on the left instead of [icon].
  final Widget? leading;
  final bool selected;
  final bool recommended;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Semantics(
        selected: selected,
        inMutuallyExclusiveGroup: true,
        child: Material(
          color: colors.surface1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color: selected ? colors.accent : colors.separator,
              width: selected ? 1.5 : 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  if (leading != null) ...[
                    leading!,
                    const SizedBox(width: 14),
                  ] else if (icon != null) ...[
                    Icon(icon,
                        size: 22,
                        color: selected ? colors.accent : colors.text2),
                    const SizedBox(width: 14),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: colors.text1,
                              ),
                            ),
                            if (recommended)
                              Text(
                                l10n.setupRecommended,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: colors.accent,
                                ),
                              ),
                          ],
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 3),
                          Text(
                            subtitle!,
                            style: TextStyle(fontSize: 13, color: colors.text2),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  _RadioMark(selected: selected),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RadioMark extends StatelessWidget {
  const _RadioMark({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? colors.accent : Colors.transparent,
        border: Border.all(
          color: selected ? colors.accent : colors.text3,
          width: 1.5,
        ),
      ),
      child: selected
          ? Icon(Icons.check_rounded, size: 15, color: colors.onAccent)
          : null,
    );
  }
}

/// A row with a switch, in the same card style as [SetupChoiceTile].
class SetupSwitchTile extends StatelessWidget {
  const SetupSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: colors.surface1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: colors.separator),
        ),
        clipBehavior: Clip.antiAlias,
        child: SwitchListTile(
          value: value,
          onChanged: onChanged,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colors.text1,
            ),
          ),
          subtitle: subtitle == null
              ? null
              : Text(subtitle!,
                  style: TextStyle(fontSize: 13, color: colors.text2)),
        ),
      ),
    );
  }
}

/// Small section label above a group of choices.
class SetupSectionLabel extends StatelessWidget {
  const SetupSectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: context.octave.text2,
        ),
      ),
    );
  }
}

/// A miniature of the home screen and the mini player, drawn with the
/// current theme, so color and mode choices are visible right away.
class SetupThemePreview extends StatelessWidget {
  const SetupThemePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.octave;

    Widget bar(double width, Color color, [double height = 8]) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        );

    Widget tile() => Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: c.surface2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  decoration: BoxDecoration(
                    color: c.accentSoft,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: c.text3,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

    Widget row() => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: c.surface3,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bar(110, c.text1.withValues(alpha: 0.85), 7),
                  const SizedBox(height: 6),
                  bar(70, c.text3, 6),
                ],
              ),
            ],
          ),
        );

    return ExcludeSemantics(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 300,
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
        decoration: BoxDecoration(
          color: c.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: c.separator),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bar(120, c.text1, 12),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: c.accent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: bar(22, c.onAccent, 6),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: c.surface2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: bar(30, c.text2, 6),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(children: [tile(), const SizedBox(width: 8), tile()]),
            const SizedBox(height: 16),
            row(),
            row(),
            const Spacer(),
            Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: c.miniPlayer,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: c.separator.withValues(alpha: 0.6)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: c.surface3,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bar(90, c.text1.withValues(alpha: 0.85), 7),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: 0.4,
                            minHeight: 3,
                            color: c.progress,
                            backgroundColor: c.progressTrack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(Icons.play_arrow_rounded, color: c.accent, size: 26),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
