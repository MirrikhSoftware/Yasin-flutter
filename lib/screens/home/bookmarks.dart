import 'package:flutter/material.dart';
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

          if (verses.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppIcons.empty,
                    width: 200.0,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppStrings.empty_bookmarks.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            );
          }
          return Scrollbar(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 24.0),
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
