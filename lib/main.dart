import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/app.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/hive_helper/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await Upgrader.clearSavedSettings();
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
}

// flutter packages pub run build_runner build  --delete-conflicting-outputs