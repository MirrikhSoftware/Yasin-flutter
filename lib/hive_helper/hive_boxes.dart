import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/hive_helper/hive_box_names.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

class HiveBoxes {
  static Box<VerseModel> get verseBox => Hive.box(HiveBoxNames.verses);
  static Box<dynamic> get prefsBox => Hive.box(HiveBoxNames.prefs);
  static Box<dynamic> get langBox => Hive.box(HiveBoxNames.language);
}
