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
import 'package:yaaseen/core/data/data.dart';
import 'package:yaaseen/core/data/page_data.dart';
import 'package:yaaseen/models/page/page_model.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/widgets.dart';

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
    for (var page in pages) {
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
    return PageView.builder(
      reverse: true,
      itemCount: pagedVerses.length,
      itemBuilder: (context, index) {
        final page = pagedVerses[index];

        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
            child: ArabicText(
              fontSize: 18,
              arabic: _getText(page.verses),
              textAlign: TextAlign.justify,
            ),
          ),
        );
      },
    );
  }

  String _getText(List<VerseModel> verses) {
    AppFormatter formatter = AppFormatter();
    List<String> arabicList = [];
    for (var i = 0; i < verses.length; i++) {
      String arabic = verses[i].arabic;
      String number = formatter.numberFormat(i + 1);
      String formatted = '\uFD3F$number\uFD3E';
      arabicList.add('$arabic $formatted ');
    }

    return arabicList.join();
  }
}
