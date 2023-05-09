// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/hive_helper/hive_box_names.dart';

class AppPref {
  static final Box<dynamic> _box = Hive.box(HiveBoxNames.prefs);
  static final Box<dynamic> _langBox = Hive.box(HiveBoxNames.language);

  // === SAVING VERSES TO STORAGE =========================================== //

  static Future setSaved() async => await _box.put(HiveKeys.saved, true);
  static bool get hasSaved => _box.get(HiveKeys.saved) ?? false;

  // === ARABIC SIZE ======================================================== //

  static Future setArabicSize(double size) async {
    await _box.put(HiveKeys.arabicSize, size);
  }

  static double get arabicSize => _box.get(HiveKeys.arabicSize) ?? 24;

  // === MEANING SIZE ======================================================= //

  static Future setMeaingSize(double size) async {
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
    await _langBox.put(HiveKeys.locale, locale);
  }

  static String get locale => _langBox.get(HiveKeys.locale) ?? 'cr';

  // === SCROLL POSITOIN ================================================= //

  static Future setScrollOffset(double offset) async {
    await _box.put(HiveKeys.scrollOffset, offset);
  }

  static double get srcollOffset => _box.get(HiveKeys.scrollOffset) ?? 0;

  // === SCROLL POSITOIN ================================================= //

  static Future setLastPlaying(int lastPlayingId) async {
    await _box.put(HiveKeys.lastPlaying, lastPlayingId);
  }

  static int get lastPlaying => _box.get(HiveKeys.lastPlaying) ?? 0;

  static Future setCounter() async {
    await _box.put(HiveKeys.counter, counter + 1);
  }

  static int get counter => _box.get(HiveKeys.counter) ?? 0;
}

class HiveKeys {
  static const String saved = 'saved';
  static const String arabicSize = 'arabic_size';
  static const String meaningSize = 'meaning_size';
  static const String transcriptionSize = 'transcription_size';
  static const String locale = 'locale';
  static const String scrollOffset = 'scroll_offset';
  static const String lastPlaying = 'last_playing';
  static const String counter = 'counter';
}
