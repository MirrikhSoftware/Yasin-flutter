import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yaaseen/app.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

import 'core/data/verses.dart';
import 'hive_helper/hive_boxes.dart';
import 'models/verse/verse_model.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp();
  await HiveService.init();
  await _saveToStorage();

  runApp(const MyApp());

  // await NotificationService().init();

  AppPref.setCounter();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  FlutterNativeSplash.remove();
}

Future _saveToStorage() async {
  Map<int, VerseModel> entries = {};
  for (final verse in verses) {
    final verseModel = VerseModel.fromJson(verse);
    entries[verseModel.key] = verseModel;
  }
  await HiveBoxes.verseBox.putAll(entries);
  await AppPref.setSaved();
}

// flutter packages pub run build_runner build  --delete-conflicting-outputs