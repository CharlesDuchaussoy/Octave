import 'package:flutter/material.dart';

import '../theme/octave_theme.dart';

/// Artwork for built-in collections without a cover (liked songs,
/// downloads…): an icon on a soft gradient of the theme's accent.
class OctaveIconArt extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final BorderRadius? borderRadius;

  const OctaveIconArt({
    super.key,
    required this.icon,
    this.iconSize = 24,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.accentSoft,
            Color.lerp(colors.accentSoft, colors.background, 0.45)!,
          ],
        ),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Icon(
          icon,
          color: colors.isDark ? colors.accent : colors.onAccentSoft,
          size: iconSize,
        ),
      ),
    );
  }
}
