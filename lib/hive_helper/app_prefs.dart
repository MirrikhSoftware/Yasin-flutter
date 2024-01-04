// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/hive_helper/hive_box_names.dart';

class AppPref {
  const AppPref._();
  static final Box<dynamic> _box = Hive.box(HiveBoxNames.pref);

  // === SAVING VERSES TO STORAGE =========================================== //

  static Future setSaved() async => await _box.put(HiveKeys.saved, true);
  static bool get hasSaved => _box.get(HiveKeys.saved) ?? false;

  // === ARABIC SIZE ======================================================== //

  static Future setArabicSize(double size) async {
    await _box.put(HiveKeys.arabicSize, size);
  }

  static double get arabicSize => _box.get(HiveKeys.arabicSize) ?? 24;

  // === MEANING SIZE ======================================================= //

  static Future setMeaningSize(double size) async {
    await _box.put(HiveKeys.meaningSize, size);
  }

  static double get meaningSize => _box.get(HiveKeys.meaningSize) ?? 18;

  // === TRANSCRIPTION SIZE ================================================= //

  static Future setTranscriptionSize(double size) async {
    await _box.put(HiveKeys.transcriptionSize, size);
  }

  static double get trSize => _box.get(HiveKeys.transcriptionSize) ?? 18;

  // === APP LOCALE ================================================= //

  static Future setLocale(String locale) async {
    await _box.put(HiveKeys.locale, locale);
  }

  static String get locale => _box.get(HiveKeys.locale) ?? 'cr';

  // === SCROLL POSITOIN ================================================= //

  static Future setScrollOffset(double offset) async {
    await _box.put(HiveKeys.scrollOffset, offset);
  }

  static double get scrollOffset => _box.get(HiveKeys.scrollOffset) ?? 0;

  // === SCROLL POSITOIN ================================================= //

  static Future setLastPlaying(int lastPlayingId) async {
    await _box.put(HiveKeys.lastPlaying, lastPlayingId);
  }

  static int get lastPlaying => _box.get(HiveKeys.lastPlaying) ?? 0;

  static Future setCounter() async {
    await _box.put(HiveKeys.counter, counter + 1);
  }

  static int get counter => _box.get(HiveKeys.counter) ?? 0;

  static Future<void> setBool(String key, bool value) => _box.put(key, value);
  static bool getBool(String key, {bool defaultValue = false}) => _box.get(
        key,
        defaultValue: defaultValue,
      );
}

class HiveKeys {
  static const saved = 'saved';
  static const arabicSize = 'arabic_size';
  static const meaningSize = 'meaning_size';
  static const transcriptionSize = 'transcription_size';
  static const locale = 'locale';
  static const scrollOffset = 'scroll_offset';
  static const lastPlaying = 'last_playing';
  static const counter = 'counter';
  static const showArabic = 'show_arabic';
  static const showMeaning = 'show_meaning ';
  static const showTranscription = 'show_transcription';
}
