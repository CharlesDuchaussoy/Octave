import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/octave_theme.dart';

/// Frosted glass panel: blurs what scrolls behind it and tints it with the
/// theme, like the floating bars of iOS. Used by the tab bar and the mini
/// player.
class OctaveGlass extends StatelessWidget {
  const OctaveGlass({
    super.key,
    required this.child,
    this.borderRadius = 24,
    this.blur = 24,
    this.opacity = 0.72,
  });

  final Widget child;
  final double borderRadius;
  final double blur;

  /// Opacity of the tint over the blurred background.
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final radius = BorderRadius.circular(borderRadius);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: colors.isDark ? 0.35 : 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.bar.withValues(alpha: opacity),
              borderRadius: radius,
              border: Border.all(
                color: colors.isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.06),
                width: 0.8,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
