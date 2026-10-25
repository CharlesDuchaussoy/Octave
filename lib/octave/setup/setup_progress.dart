import 'package:shared_preferences/shared_preferences.dart';

/// Remembers whether the guided setup is done and where it stopped, so a
/// closed app resumes at the same step.
class SetupProgress {
  SetupProgress._();

  static const String _keyDone = 'octave_setup_done';
  static const String _keyStep = 'octave_setup_step';

  static Future<bool> isDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyDone) ?? false;
  }

  static Future<String?> savedStep() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyStep);
  }

  static Future<void> saveStep(String step) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyStep, step);
  }

  static Future<void> markDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyDone, true);
    await prefs.remove(_keyStep);
  }
}
