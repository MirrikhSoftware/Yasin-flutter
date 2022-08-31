
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/hive_helper/hive_box_names.dart';

class AppPrefs {
  static final Box<dynamic> _box = Hive.box(HiveBoxNames.prefs);

  static Future setSaved() async => await _box.put(HiveKeys.saved, true);
  static bool get hasSaved => _box.get(HiveKeys.saved) ?? false;
}

class HiveKeys {
  static const String saved = 'saved';
}
