import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'octave_colors.dart';

export 'octave_colors.dart';
export 'octave_palette.dart';

/// Builds the app's [ThemeData] from [OctaveColors], so Material and
/// Cupertino widgets follow the same tokens as Octave's own screens.
class OctaveTheme {
  OctaveTheme._();

  /// Bundled with the app (SIL Open Font License), never downloaded.
  static const String fontFamily = 'Inter';

  static ThemeData build(OctaveColors c) {
    final isDark = c.isDark;
    final scheme = ColorScheme(
      brightness: c.brightness,
      primary: c.accent,
      onPrimary: c.onAccent,
      primaryContainer: c.accentSoft,
      onPrimaryContainer: c.onAccentSoft,
      secondary: c.accent,
      onSecondary: c.onAccent,
      secondaryContainer: c.accentSoft,
      onSecondaryContainer: c.onAccentSoft,
      tertiary: c.accent,
      onTertiary: c.onAccent,
      error: c.danger,
      onError: isDark ? c.background : const Color(0xFFFFFFFF),
      surface: c.surface1,
      onSurface: c.text1,
      onSurfaceVariant: c.text2,
      surfaceContainerLowest: c.background,
      surfaceContainerLow: c.surface1,
      surfaceContainer: c.surface1,
      surfaceContainerHigh: c.surface2,
      surfaceContainerHighest: c.surface3,
      outline: c.text3,
      outlineVariant: c.separator,
      inverseSurface: c.text1,
      onInverseSurface: c.background,
      inversePrimary: c.accentSoft,
      shadow: const Color(0xFF000000),
      scrim: const Color(0xFF000000),
      surfaceTint: Colors.transparent,
    );

    TextStyle t(double size, FontWeight weight, Color color,
            [double letterSpacing = 0]) =>
        TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          letterSpacing: letterSpacing,
        );

    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: c.brightness,
      colorScheme: scheme,
      extensions: [c],
      primaryColor: c.accent,
      scaffoldBackgroundColor: c.background,
      canvasColor: c.background,
      dividerColor: c.separator,
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        foregroundColor: c.text1,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: t(34, FontWeight.bold, c.text1, -0.5),
      ),
      cardTheme: CardThemeData(
        color: c.surface1,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      dividerTheme: DividerThemeData(color: c.separator, thickness: 0.5),
      textTheme: TextTheme(
        displayLarge: t(34, FontWeight.bold, c.text1, -0.5),
        displayMedium: t(28, FontWeight.bold, c.text1, -0.5),
        headlineLarge: t(22, FontWeight.bold, c.text1),
        headlineMedium: t(20, FontWeight.w600, c.text1),
        // Section headings ("Titres populaires", genres, collections).
        headlineSmall: t(20, FontWeight.bold, c.text1, -0.3),
        titleLarge: t(17, FontWeight.w600, c.text1),
        titleMedium: t(15, FontWeight.w500, c.text1),
        bodyLarge: t(17, FontWeight.normal, c.text1),
        bodyMedium: t(15, FontWeight.normal, c.text1),
        bodySmall: t(13, FontWeight.normal, c.text2),
        labelLarge: t(15, FontWeight.w500, c.accent),
      ),
      iconTheme: IconThemeData(color: c.text1),
      listTileTheme: ListTileThemeData(
        iconColor: c.text2,
        textColor: c.text1,
        subtitleTextStyle: t(13, FontWeight.normal, c.text2),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: c.bar,
        selectedItemColor: c.accent,
        unselectedItemColor: c.text3,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: c.bar,
        indicatorColor: c.accentSoft,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: c.accent,
        unselectedLabelColor: c.text2,
        indicatorColor: c.accent,
        dividerColor: c.separator,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.accent,
          foregroundColor: c.onAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: c.accent,
          foregroundColor: c.onAccent,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.text1,
          side: BorderSide(color: c.separator),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: c.accent),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: c.text1),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: c.accent,
        foregroundColor: c.onAccent,
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: c.surface2,
        selectedColor: c.accent,
        disabledColor: c.surface2,
        labelStyle: t(14, FontWeight.w500, c.text1),
        secondaryLabelStyle: t(14, FontWeight.w600, c.onAccent),
        side: BorderSide.none,
        shape: const StadiumBorder(),
        checkmarkColor: c.onAccent,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? c.onAccent : c.text2),
        trackColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? c.accent : c.surface3),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? Colors.transparent
                : c.separator),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? c.accent : null),
        checkColor: WidgetStatePropertyAll(c.onAccent),
        side: BorderSide(color: c.text3, width: 1.5),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? c.accent : c.text3),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: c.progress,
        inactiveTrackColor: c.progressTrack,
        thumbColor: c.progress,
        overlayColor: c.progress.withValues(alpha: 0.12),
        valueIndicatorColor: c.surface3,
        valueIndicatorTextStyle: t(13, FontWeight.w600, c.text1),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.progress,
        linearTrackColor: c.progressTrack,
        circularTrackColor: c.progressTrack,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surface2,
        hintStyle: t(15, FontWeight.normal, c.text3),
        labelStyle: t(15, FontWeight.normal, c.text2),
        prefixIconColor: c.text2,
        suffixIconColor: c.text2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: c.accent, width: 1.5),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: c.accent,
        selectionColor: c.accent.withValues(alpha: 0.3),
        selectionHandleColor: c.accent,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.surface2,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titleTextStyle: t(20, FontWeight.w600, c.text1),
        contentTextStyle: t(15, FontWeight.normal, c.text2),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surface1,
        modalBackgroundColor: c.surface1,
        surfaceTintColor: Colors.transparent,
        dragHandleColor: c.text3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: c.surface2,
        surfaceTintColor: Colors.transparent,
        textStyle: t(15, FontWeight.normal, c.text1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(c.surface2),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: c.text1,
        contentTextStyle: t(14, FontWeight.w500, c.background),
        actionTextColor: c.accentSoft,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: c.text1,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: t(13, FontWeight.w500, c.background),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: c.accent,
        brightness: c.brightness,
        scaffoldBackgroundColor: c.background,
        barBackgroundColor: c.bar,
      ),
    );
  }
}
