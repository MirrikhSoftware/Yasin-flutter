import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/widgets/widgets.dart';

class ReadingModeScreen extends StatelessWidget {
  const ReadingModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ArabicText(
            textAlign: TextAlign.justify,
            arabic: _getText(),
          ),
        ),
      ),
    );
  }

  String _getText() {
    AppFormatter formatter = AppFormatter();

    List<String> arabicList = [];
    for (var i = 0; i < verses.length; i++) {
      String arabic = verses[i]['arabic'];
      String number = formatter.numberFormat(i + 1);
      String formatted = '\uFD3F$number\uFD3E';
      arabicList.add('$arabic$formatted ');
    }

    return arabicList.join();
  }
}
