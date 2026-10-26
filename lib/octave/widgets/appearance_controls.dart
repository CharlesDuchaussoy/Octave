import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../services/theme_service.dart';
import '../theme/octave_theme.dart';

/// Name shown under a color swatch and in the setup summary.
String accentColorName(AppLocalizations l10n, AccentColor color) =>
    switch (color) {
      AccentColor.octave => l10n.colorNameOctave,
      AccentColor.pink => l10n.colorNamePink,
      AccentColor.red => l10n.colorNameRed,
      AccentColor.orange => l10n.colorNameOrange,
      AccentColor.yellow => l10n.colorNameYellow,
      AccentColor.mint => l10n.colorNameMint,
      AccentColor.green => l10n.colorNameGreen,
      AccentColor.teal => l10n.colorNameTeal,
      AccentColor.blue => l10n.colorNameBlue,
      AccentColor.iris => l10n.colorNameIris,
      AccentColor.purple => l10n.colorNamePurple,
      AccentColor.sand => l10n.colorNameSand,
      AccentColor.slate => l10n.colorNameSlate,
      AccentColor.dynamicColor => l10n.colorNameDynamic,
    };

/// Round named swatches to pick the color the whole palette is computed
/// from.
class OctaveColorSwatches extends StatelessWidget {
  const OctaveColorSwatches({
    super.key,
    required this.selected,
    required this.onChanged,
    this.size = 34,
  });

  final AccentColor selected;
  final ValueChanged<AccentColor> onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    return Wrap(
      spacing: 6,
      runSpacing: 10,
      children: AccentColor.values.map((color) {
        final isSelected = selected == color;
        final swatch = color.color;
        final onSwatch = ThemeData.estimateBrightnessForColor(swatch) ==
                Brightness.dark
            ? Colors.white
            : Colors.black;
        final name = accentColorName(l10n, color);
        return Semantics(
          selected: isSelected,
          button: true,
          label: name,
          excludeSemantics: true,
          child: GestureDetector(
            onTap: () => onChanged(color),
            child: SizedBox(
              width: size + 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    width: size,
                    height: size,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? colors.text1 : colors.separator,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.isDynamic ? colors.surface3 : swatch,
                      ),
                      child: color.isDynamic
                          ? Icon(Icons.wallpaper_rounded,
                              size: size * 0.45, color: colors.text2)
                          : (isSelected
                              ? Icon(Icons.check_rounded,
                                  size: size * 0.5, color: onSwatch)
                              : null),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected ? colors.text1 : colors.text2,
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

/// Slider from neutral grey backgrounds to clearly colored ones.
class OctaveIntensitySlider extends StatelessWidget {
  const OctaveIntensitySlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeEnd,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final ValueChanged<double>? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    final labelStyle = TextStyle(fontSize: 12, color: colors.text2);
    return Column(
      children: [
        Slider(
          value: value,
          onChanged: onChanged,
          onChangeEnd: onChangeEnd,
          semanticFormatterCallback: (v) => '${(v * 100).round()} %',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.colorIntensityNeutral, style: labelStyle),
              Text(l10n.colorIntensityVivid, style: labelStyle),
            ],
          ),
        ),
      ],
    );
  }
}
