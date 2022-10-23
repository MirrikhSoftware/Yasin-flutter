import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:yaaseen/hive_helper/hive_box_names.dart';
import 'package:yaaseen/models/models.dart';

class HiveService {
  static Future init() async {
    Directory directory = await pp.getApplicationSupportDirectory();
    String path = directory.path;
    await Hive.initFlutter(path);

    Hive.registerAdapter(VerseModelAdapter());
    Hive.registerAdapter(FeedbackAdapter());
    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(LogAdapter());

    await Hive.openBox<VerseModel>(HiveBoxNames.verses);
    await Hive.openBox<dynamic>(HiveBoxNames.prefs);
    await Hive.openBox<dynamic>(HiveBoxNames.language);
    await Hive.openBox<FeedbackModel>(HiveBoxNames.feedbacks);
    await Hive.openBox<NewsModel>(HiveBoxNames.news);
    await Hive.openBox<LogModel>(HiveBoxNames.log);
  }
}
