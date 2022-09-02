import 'package:flutter/material.dart';
import 'package:yaaseen/core/constants/app_strings.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/widgets.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: AppStrings.bookmarks.tr()),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.verseBox.listenable(),
        builder: (context, Box<VerseModel> box, child) {
          List<VerseModel> verses =
              box.values.where((verse) => verse.isSaved).toList();
          return Scrollbar(
            // controller: _scrollController,
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 24.h),
              // controller: _scrollController,
              
              itemCount: verses.length,
              separatorBuilder: (ctx, i) => const Divider(),
              itemBuilder: (context, index) {
                VerseModel verse = verses[index];
                return VerseListTile(verse: verse);
              },
            ),
          );
        },
      ),
    );
  }
}
