import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:yaaseen/hive_helper/hive_box_names.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

class HiveService {
  static Future init() async {
    Directory directory = await pp.getApplicationSupportDirectory();
    String path = directory.path;
    await Hive.initFlutter(path);

    Hive.registerAdapter(VerseModelAdapter());

    await Hive.openBox<VerseModel>(HiveBoxNames.verses);
    await Hive.openBox<dynamic>(HiveBoxNames.prefs);
    await Hive.openBox<dynamic>(HiveBoxNames.language);
  }
}
