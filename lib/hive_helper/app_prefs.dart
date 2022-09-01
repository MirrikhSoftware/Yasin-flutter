// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/hive_helper/hive_box_names.dart';

class AppPrefs {
  static final Box<dynamic> _box = Hive.box(HiveBoxNames.prefs);

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
}

class HiveKeys {
  static const String saved = 'saved';
  static const String arabic_size = 'arabic_size';
  static const String meaning_size = 'meaning_size';
  static const String transcription_size = 'transcription_size';
  
}
