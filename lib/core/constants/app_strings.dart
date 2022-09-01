import 'package:yaaseen/hive_helper/app_prefs.dart';

class AppStrings {
  static const String app_name = 'app_name';
  static const String settings = 'settings';
  static const String arabic = 'arabic';
  static const String meaning = 'meaning';
  static const String transcription = 'transcription';
  static const String about_sura = 'about_sura';
}

extension StringExtension on String {
  String tr() {
    AppLocales locales = AppLocales();
    return locales.locales[this]![AppPrefs.locale].toString();
  }
}

class AppLocales {
  Map<String, Map<String, String>> get locales => _locales();
  Map<String, Map<String, String>> _locales() => {
        AppStrings.app_name: _setString('Yosin surasi', 'Ёсин сураси'),
        AppStrings.settings: _setString('Sozlamalar', 'Созламалар'),
        AppStrings.arabic: _setString('Arabiy', 'Aрабий'),
        AppStrings.meaning: _setString("Ma'nosi", 'Маъноси'),
        AppStrings.transcription: _setString("Transkripsiya", 'Транскрипсия'),
        AppStrings.about_sura: _setString("Sura haqida", 'Сура ҳақида'),
      };
  Map<String, String> _setString(String uz, String cr) => {
        "uz": uz,
        "cr": cr,
      };
}
