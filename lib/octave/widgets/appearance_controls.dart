import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../services/theme_service.dart';
import '../theme/octave_theme.dart';

/// Round swatches to pick the color the whole palette is computed from.
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
      spacing: 12,
      runSpacing: 12,
      children: AccentColor.values.map((color) {
        final isSelected = selected == color;
        final swatch = color.color;
        final onSwatch = ThemeData.estimateBrightnessForColor(swatch) ==
                Brightness.dark
            ? Colors.white
            : Colors.black;
        return Tooltip(
          message: color.isDynamic
              ? l10n.dynamicColor
              : (color == AccentColor.octave ? l10n.accentColorOctave : ''),
          child: Semantics(
            selected: isSelected,
            button: true,
            child: GestureDetector(
              onTap: () => onChanged(color),
              child: AnimatedContainer(
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
