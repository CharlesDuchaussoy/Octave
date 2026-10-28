import 'package:flutter/material.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_theme.dart';

class SettingsIconBadge extends StatelessWidget {
  final IconData icon;

  const SettingsIconBadge({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    return Container(
      width: AppDimensions.iconBadgeSize,
      height: AppDimensions.iconBadgeSize,
      decoration: BoxDecoration(
        color: colors.accentSoft,
        borderRadius: BorderRadius.circular(AppDimensions.iconBadgeRadius),
      ),
      child: Icon(
        icon,
        color: colors.isDark ? colors.accent : colors.onAccentSoft,
        size: AppDimensions.iconSize,
      ),
    );
  }
}
