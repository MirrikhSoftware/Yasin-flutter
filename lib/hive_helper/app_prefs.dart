// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/hive_helper/hive_box_names.dart';

class AppPrefs {
  static final Box<dynamic> _box = Hive.box(HiveBoxNames.prefs);
  static final Box<dynamic> _langBox = Hive.box(HiveBoxNames.language);

  // === SAVING VERSES TO STORAGE =========================================== //

  static Future setSaved() async => await _box.put(HiveKeys.saved, true);
  static bool get hasSaved => _box.get(HiveKeys.saved) ?? false;

  // === ARABIC SIZE ======================================================== //

  static Future setArabicSize(double size) async {
    await _box.put(HiveKeys.arabic_size, size);
  }

  static double get arabicSize => _box.get(HiveKeys.arabic_size) ?? 24;

  // === MEANING SIZE ======================================================= //

  static Future setMeaingSize(double size) async {
    await _box.put(HiveKeys.meaning_size, size);
  }

  static double get meaningSize => _box.get(HiveKeys.meaning_size) ?? 18;

  // === TRANSCRIPTION SIZE ================================================= //

  static Future setTranscriptionSize(double size) async {
    await _box.put(HiveKeys.transcription_size, size);
  }

  static double get trSize => _box.get(HiveKeys.transcription_size) ?? 18;

  // === APP LOCALE ================================================= //

  static Future setLocale(String locale) async {
    await _langBox.put(HiveKeys.locale, locale);
  }

  static String get locale => _langBox.get(HiveKeys.locale) ?? 'cr';

  // === SCROLL POSITOIN ================================================= //

  static Future setScrollOffset(double offset) async {
    await _box.put(HiveKeys.scroll_offset, offset);
  }

  static double get srcollOffset => _box.get(HiveKeys.scroll_offset) ?? 0;


  // === SCROLL POSITOIN ================================================= //

  static Future setLastPlaying(int lastPlayingId) async {
    await _box.put(HiveKeys.last_playing, lastPlayingId);
  }

  static int? get lastPlaying => _box.get(HiveKeys.last_playing);
}

class HiveKeys {
  static const String saved = 'saved';
  static const String arabic_size = 'arabic_size';
  static const String meaning_size = 'meaning_size';
  static const String transcription_size = 'transcription_size';
  static const String locale = 'locale';
  static const String scroll_offset = 'scroll_offset';
  static const String last_playing = 'last_playing';
}
