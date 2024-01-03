import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart' hide verses;
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/widgets/widgets.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.bookmarks.tr())),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.verseBox.listenable(),
        builder: (context, box, child) {
          if (box.isEmpty) {
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
              itemCount: box.length,
              separatorBuilder: (ctx, i) => const Divider(),
              itemBuilder: (context, index) {
                final verse = box.getAt(index)!;
                return VerseListTile(verse: verse);
              },
            ),
          );
        },
      ),
    );
  }
}
