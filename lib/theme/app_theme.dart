import 'package:flutter/material.dart';

export 'package:musly/octave/theme/octave_theme.dart';

/// Fixed colors of the default Octave palette (night blue, intensity 50 %).
///
/// Screens should read `context.octave` instead, which follows the color,
/// mode and intensity chosen in the settings. These constants remain for
/// the few places without a [BuildContext].
class AppTheme {
  /// Brand blues of the logo, for always-dark brand screens (welcome).
  static const Color brandNight = Color(0xFF071526);
  static const Color brandNavy = Color(0xFF0E2A47);
  static const Color brandDeep = Color(0xFF1F4E7A);
  static const Color brandBlue = Color(0xFF2F6FB0);
  static const Color brandIce = Color(0xFF7FB2E5);
  static const Color brandSky = Color(0xFFA8C9F6);

  static const Color lightBackground = Color(0xFFF4F6FD);
  static const Color lightSurface = Colors.white;
  static const Color lightCard = Colors.white;
  static const Color lightDivider = Color(0xFFD8DAE1);
  static const Color lightSecondaryText = Color(0xFF5A5F66);

  static const Color darkBackground = Color(0xFF0D1622);
  static const Color darkSurface = Color(0xFF151E2A);
  static const Color darkCard = Color(0xFF1D2632);
  static const Color darkElevated = Color(0xFF2A3340);
  static const Color darkDivider = Color(0xFF383E48);
  static const Color darkSecondaryText = Color(0xFFB4B6BD);
  static const Color darkTertiaryText = Color(0xFF7E8188);
}
