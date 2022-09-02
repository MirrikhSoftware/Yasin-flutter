import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';

import '../hive_helper/hive_helper.dart';

class ArabicText extends StatelessWidget {
  final String arabic;
  const ArabicText({Key? key, required this.arabic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        arabic,
        textAlign: TextAlign.start,
        locale: const Locale('ar'),
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: AppPrefs.arabicSize,
          fontFamily: AppFonts.meQuran,
          wordSpacing: 12,
          height: 1.8,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
