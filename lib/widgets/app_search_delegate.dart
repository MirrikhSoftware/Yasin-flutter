import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/widgets.dart';

class AppSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      platform: TargetPlatform.iOS,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.green,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.white,
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(color: AppColors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: AppColors.white),
        border: InputBorder.none,
        helperStyle: TextStyle(),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return _showFoundVerses();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _showFoundVerses();
  }

  Widget _showFoundVerses() {
    String lang = AppPrefs.locale;
    List<VerseModel> verses = HiveBoxes.verseBox.values.where((verse) {
      if (lang == 'uz') {
        String transcription = verse.transcriptionUz!.toLowerCase();
        String meaning = verse.meaningUz!.toLowerCase();

        if (transcription.contains(query.trim().toLowerCase()) ||
            meaning.contains(query.toLowerCase())) {
          return true;
        }
      } else {
        String transcription = verse.transcription!.toLowerCase();
        String meaning = verse.meaning!.toLowerCase();

        if (transcription.contains(query.trim().toLowerCase()) ||
            meaning.contains(query.toLowerCase())) {
          return true;
        }
      }
      return false;
    }).toList();
    return ListView.builder(
      itemCount: verses.length,
      itemBuilder: (context, index) {
        VerseModel verse = verses[index];
        return VerseListTile(verse: verse);
      },
    );
  }
}
