import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'translations.dart';

const _kLangKey = 'app_language';

final localeProvider =
    StateNotifierProvider<LocaleNotifier, Locale>((ref) => LocaleNotifier());

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('vi')) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_kLangKey);
    if (code != null) {
      state = Locale(code);
      AppTranslations.locale = state;
    }
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    AppTranslations.locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLangKey, locale.languageCode);
  }

  Future<void> toggle() async {
    final newLocale =
        state.languageCode == 'vi' ? const Locale('en') : const Locale('vi');
    await setLocale(newLocale);
  }
}
