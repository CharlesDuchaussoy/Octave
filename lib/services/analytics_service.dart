import 'package:flutter/material.dart';

class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  bool _initialized = false;
  bool _enabled = false;

  bool get isEnabled => _enabled;
  bool get isInitialized => _initialized;

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;
  }

  Future<void> setEnabled(bool enabled) async {
    _enabled = enabled;
  }

  Future<void> recordEvent(
    String eventKey, [
    Map<String, dynamic>? segmentation,
  ]) async {}

  Future<void> recordScreenView(String screenName) async {}

  Future<void> recordRating(int rating, [String? feedback]) async {}

  Future<void> recordFeatureUsage(String featureName) async {}

  Future<void> recordPlaybackStarted(String source) async {}

  Future<void> recordDownload(String type, int count) async {}

  Future<void> setConsent(String consent, bool enabled) async {}

  Future<void> recordError(String error, StackTrace? stackTrace) async {}

  Future<String?> getDeviceId() async => null;
}

class AnalyticsNavigatorObserver extends NavigatorObserver {}
