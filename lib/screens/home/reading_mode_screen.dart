import 'package:flutter/material.dart';
import 'package:yaaseen/core/data/data.dart';

class ReadingModeScreen extends StatelessWidget {
  const ReadingModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: List.generate(
          verses.length,
          (index) => Text(verses[index]['arabic']),
        ),
      ),
    );
  }
}
