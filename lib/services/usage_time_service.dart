import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsageTimeService extends ChangeNotifier with WidgetsBindingObserver {
  static final UsageTimeService _instance = UsageTimeService._internal();
  factory UsageTimeService() => _instance;
  UsageTimeService._internal();

  static const String _prefsKeyUsageTime = 'app_usage_time_seconds';

  DateTime? _sessionStartTime;
  int _accumulatedSeconds = 0;
  bool _initialized = false;

  int get accumulatedSeconds => _accumulatedSeconds;

  Future<void> initialize() async {
    if (_initialized) return;

    final prefs = await SharedPreferences.getInstance();
    _accumulatedSeconds = prefs.getInt(_prefsKeyUsageTime) ?? 0;

    WidgetsBinding.instance.addObserver(this);

    _initialized = true;
    debugPrint(
        '[UsageTime] Initialized with $_accumulatedSeconds seconds accumulated');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _saveSessionTime();
    super.dispose();
  }

  void disposeService() {
    dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _onAppForeground();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _onAppBackground();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        break;
    }
  }

  void _onAppForeground() {
    _sessionStartTime = DateTime.now();
    debugPrint('[UsageTime] App entered foreground');
  }

  void _onAppBackground() {
    _saveSessionTime();
    debugPrint(
        '[UsageTime] App entered background. Total: $_accumulatedSeconds seconds');
  }

  Future<void> _saveSessionTime() async {
    if (_sessionStartTime != null) {
      final sessionDuration =
          DateTime.now().difference(_sessionStartTime!).inSeconds;
      if (sessionDuration > 0) {
        _accumulatedSeconds += sessionDuration;
        await _saveToPrefs();
      }
      _sessionStartTime = null;
    }
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKeyUsageTime, _accumulatedSeconds);
  }

  Future<void> reset() async {
    _accumulatedSeconds = 0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKeyUsageTime);
    notifyListeners();
  }

  String get formattedTime {
    final minutes = _accumulatedSeconds ~/ 60;
    final seconds = _accumulatedSeconds % 60;
    if (minutes > 0) {
      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    }
    return '${seconds}s';
  }
}
