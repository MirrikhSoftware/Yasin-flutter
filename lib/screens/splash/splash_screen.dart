import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/app_colors.dart';
import 'package:yaaseen/core/constants/constants.dart';
import 'package:yaaseen/core/data/data.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/route/app_navigator.dart';
import 'package:yaaseen/route/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

     if (!AppPrefs.hasSaved) {
      _saveToStorage().then((value) {
        AppNavigator.pushNamedAndRemoveUntil(RouteNames.home);
      });
    } else {
      Timer(
        const Duration(milliseconds: 500),
        () {
          AppNavigator.pushNamedAndRemoveUntil(RouteNames.home);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: SvgPicture.asset(
          AppIcons.logo,
          width: 240.w,
        ),
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
