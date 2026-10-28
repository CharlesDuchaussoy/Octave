import 'package:flutter/material.dart';
import 'package:musly/octave/theme/octave_palette.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Colors offered to the user, in display order. Saved by [persistKey],
/// so the order can change freely.
enum AccentColor {
  octave,
  pink,
  red,
  orange,
  yellow,
  mint,
  green,
  teal,
  blue,
  iris,
  purple,
  sand,
  slate,
  dynamicColor,
}

extension AccentColorExt on AccentColor {
  /// Seed color the whole palette is computed from.
  Color get color {
    switch (this) {
      case AccentColor.octave:
        return OctavePalette.octaveSeed;
      case AccentColor.red:
        return const Color(0xFFD7263D);
      case AccentColor.orange:
        return const Color(0xFFF26B1D);
      case AccentColor.yellow:
        return const Color(0xFFF2B705);
      case AccentColor.green:
        return const Color(0xFF2E8B57);
      case AccentColor.mint:
        return const Color(0xFF3CB98A);
      case AccentColor.teal:
        return const Color(0xFF1597B8);
      case AccentColor.blue:
        return const Color(0xFF1F6FEB);
      case AccentColor.iris:
        return const Color(0xFF5B5FE0);
      case AccentColor.pink:
        return const Color(0xFFE0457B);
      case AccentColor.purple:
        return const Color(0xFF9B6FD6);
      case AccentColor.sand:
        return const Color(0xFFC2A274);
      case AccentColor.slate:
        return const Color(0xFF5B6B7A);
      case AccentColor.dynamicColor:
        return OctavePalette.octaveSeed;
    }
  }

  String get persistKey {
    switch (this) {
      case AccentColor.octave:
        return 'octave';
      case AccentColor.red:
        return 'red';
      case AccentColor.orange:
        return 'orange';
      case AccentColor.yellow:
        return 'yellow';
      case AccentColor.green:
        return 'green';
      case AccentColor.teal:
        return 'teal';
      case AccentColor.blue:
        return 'blue';
      case AccentColor.pink:
        return 'pink';
      case AccentColor.purple:
        return 'purple';
      case AccentColor.mint:
        return 'mint';
      case AccentColor.iris:
        return 'iris';
      case AccentColor.sand:
        return 'sand';
      case AccentColor.slate:
        return 'slate';
      case AccentColor.dynamicColor:
        return 'dynamic';
    }
  }

  bool get isDynamic => this == AccentColor.dynamicColor;

  static AccentColor fromKey(String key) {
    for (final color in AccentColor.values) {
      if (color.persistKey == key) return color;
    }
    return AccentColor.octave;
  }
}

class ThemeService extends ChangeNotifier {
  static const String _keyThemeMode = 'app_theme_mode';
  static const String _keyAccentColor = 'app_accent_color';
  static const String _keyLiquidGlass = 'app_liquid_glass';
  static const String _keyPureBlack = 'app_pure_black';
  static const String _keyIntensity = 'app_color_intensity';

  ThemeMode _themeMode = ThemeMode.system;
  AccentColor _accentColor = AccentColor.octave;
  bool _liquidGlass = true;
  bool _pureBlack = false;
  double _intensity = OctavePalette.defaultIntensity;

  ThemeMode get themeMode => _themeMode;
  AccentColor get accentColor => _accentColor;
  bool get liquidGlass => _liquidGlass;

  /// Dark mode uses a pure black background (saves battery on OLED).
  bool get pureBlack => _pureBlack;

  /// How much the seed color tints backgrounds, from 0 to 1.
  double get intensity => _intensity;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    final modeKey = prefs.getString(_keyThemeMode) ?? 'system';
    _themeMode = _themeModeFromKey(modeKey);

    final colorKey = prefs.getString(_keyAccentColor) ?? 'octave';
    _accentColor = AccentColorExt.fromKey(colorKey);

    _liquidGlass = prefs.getBool(_keyLiquidGlass) ?? true;
    _pureBlack = prefs.getBool(_keyPureBlack) ?? false;
    _intensity =
        prefs.getDouble(_keyIntensity) ?? OctavePalette.defaultIntensity;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, _themeModeToKey(mode));
  }

  Future<void> setAccentColor(AccentColor color) async {
    _accentColor = color;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccentColor, color.persistKey);
  }

  Future<void> setLiquidGlass(bool enabled) async {
    _liquidGlass = enabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLiquidGlass, enabled);
  }

  Future<void> setPureBlack(bool enabled) async {
    _pureBlack = enabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyPureBlack, enabled);
  }

  Future<void> setIntensity(double value) async {
    _intensity = value.clamp(0.0, 1.0);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyIntensity, _intensity);
  }

  static ThemeMode _themeModeFromKey(String key) {
    switch (key) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static String _themeModeToKey(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }
}
