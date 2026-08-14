import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'printer_models.dart';

class PrinterSettingsStore extends ChangeNotifier {
  static const _kPrefKey = 'printer_settings_v1';

  PrinterSettings _settings = const PrinterSettings();
  PrinterSettings get settings => _settings;

  bool get isConfigured => _settings.isConfigured;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kPrefKey);
      if (raw != null && raw.isNotEmpty) {
        final decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          _settings = PrinterSettings.fromJson(decoded);
          notifyListeners();
        }
      }
    } catch (_) {}
  }

  Future<void> update(PrinterSettings settings) async {
    _settings = settings;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kPrefKey, jsonEncode(settings.toJson()));
    } catch (_) {}
  }

  Future<void> reset() => update(const PrinterSettings());
}
