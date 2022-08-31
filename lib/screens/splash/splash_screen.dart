import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yaaseen/core/constants/app_colors.dart';
import 'package:yaaseen/core/data/data.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/route/app_navigator.dart';
import 'package:yaaseen/route/app_route.dart';
import 'package:yaaseen/route/route_names.dart';

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
        AppNavigator.pushNamed(RouteNames.home);
      });
    } else {
      Timer(
        const Duration(milliseconds: 500),
        () {
          AppNavigator.pushNamed(RouteNames.home);
        },
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: Text('Yaseen'),
      ),
    );
  }

  Future _saveToStorage() async {
    Map<int, VerseModel> entries = {};
    for (var verse in verses) {
      VerseModel verseModel = VerseModel.fromJson(verse);
      entries[verseModel.key] = verseModel;
    }
    await HiveBoxes.verseBox.putAll(entries);
    await AppPrefs.setSaved();
  }
}
