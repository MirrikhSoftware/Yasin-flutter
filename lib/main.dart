import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/app.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
}

