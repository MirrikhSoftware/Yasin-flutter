import 'package:flutter/material.dart';
import 'package:yaaseen/core/data/data.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  if (!AppPrefs.hasSaved) {
    _saveToStorage().then((value) {
      // Appna
    });
  }
  

    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future _saveToStorage() async {
    Map<int, VerseModel> entries = {};
    for (var verse in verses) {
      VerseModel verseModel = VerseModel.fromJson(verse);
      entries[verseModel.key] = verseModel;
    }
    await HiveBoxes.verseBox.putAll(entries);
  }
}
