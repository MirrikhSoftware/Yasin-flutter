/*

  Created by: Bakhromjon Polat
  Created on: Jun 25 2023 21:50:16
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/core/data/page_data.dart';
import 'package:yaaseen/models/page/page_model.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

class BookViewPage extends StatefulWidget {
  const BookViewPage({super.key});

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  final pagedVerses = <PageModel>[];
  AppFormatter formatter = AppFormatter();

  @override
  void initState() {
    super.initState();

    final pages = PageData.page.where((page) => page['surah'] == 36);
    for (final page in pages) {
      final pageModel = PageModel.fromJson(page);
      final selectedVerses = verses
          .where((verse) =>
              verse['verse_id'] >= pageModel.start &&
              verse['verse_id'] <= pageModel.end)
          .toList();
      pagedVerses.add(
        pageModel.copyWith(
          verses: selectedVerses.map((e) => VerseModel.fromJson(e)).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        reverse: true,
        itemCount: pagedVerses.length,
        itemBuilder: (context, index) {
          final page = pagedVerses[index];

          return Card(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 64,
                ),
                child: Text.rich(
                  _getArabicText(page.verses),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                )),
          );
        },
      ),
    );
  }

  TextSpan _getArabicText(List<VerseModel> verses) {
    final arabicList = <String>[];
    final numbers = <String>[];
    for (var i = 0; i < verses.length; i++) {
      final arabic = verses[i].arabic;
      final number = formatter.numberFormat(verses[i].verseId);
      final formatted = '\uFD3F$number\uFD3E';
      arabicList.add(arabic);
      numbers.add(formatted);
    }
    return TextSpan(
      children: List.generate(
        arabicList.length * 2,
        (index) {
          final arabic = arabicList[index ~/ 2];
          final number = numbers[index ~/ 2];
          if (index % 2 == 0) {
            return TextSpan(
              text: arabic,
              locale: const Locale('ar'),
              style: const TextStyle(
                fontFamily: 'Me-Quran2',
                fontSize: 20.0,
                height: 2.2,
              ),
            );
          }
          return TextSpan(
            text: ' $number ',
            locale: const Locale('ar'),
            style: const TextStyle(
              fontFamily: AppFonts.meQuran,
            ),
          );
        },
      ),
    );
  }

  // String _getText(List<VerseModel> verses) {
  //   List<String> arabicList = [];
  //   for (int i = 0; i < verses.length; i++) {
  //     final arabic = verses[i].arabic;
  //     final number = formatter.numberFormat(i + 1);
  //     final formatted = '\uFD3F$number\uFD3E';
  //     arabicList.add('$arabic $formatted ');
  //   }

  //   return arabicList.join();
  // }
}
