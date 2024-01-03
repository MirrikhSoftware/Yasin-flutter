import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/hive_helper/hive_box_names.dart';
import 'package:yaaseen/models/models.dart';

class HiveBoxes {
  static Box<VerseModel> get verseBox => Hive.box(HiveBoxNames.verses);
  static Box<dynamic> get prefBox => Hive.box(HiveBoxNames.pref);
  static Box<dynamic> get langBox => Hive.box(HiveBoxNames.language);
  static Box<LogModel> get logBox => Hive.box(HiveBoxNames.log);
}
