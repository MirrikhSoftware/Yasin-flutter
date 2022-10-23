import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/hive_helper/hive_box_names.dart';
import 'package:yaaseen/models/models.dart';

class HiveBoxes {
  static Box<VerseModel> get verseBox => Hive.box(HiveBoxNames.verses);
  static Box<dynamic> get prefsBox => Hive.box(HiveBoxNames.prefs);
  static Box<dynamic> get langBox => Hive.box(HiveBoxNames.language);
  static Box<FeedbackModel> get feedbackBox => Hive.box(HiveBoxNames.feedbacks);
  static Box<NewsModel> get newsBox => Hive.box(HiveBoxNames.news);
 
}
