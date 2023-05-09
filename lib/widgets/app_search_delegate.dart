import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/route/app_navigator.dart';
import 'package:yaaseen/widgets/widgets.dart';

class AppSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => AppStrings.search.tr();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.green,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.white),
          border: InputBorder.none,
          helperStyle: TextStyle(),
        ),
        iconTheme: const IconThemeData(color: AppColors.green));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      AppIconButton(
        icon: Icons.clear,
        onPressed: () {
          if (query.isEmpty) {
            AppNavigator.pop();
          } else {
            query = '';
          }
        },
      )
    ];
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
    if (query.trim().isEmpty) {
      return Container(color: AppColors.background);
    }
    String lang = AppPref.locale;
    final q = query.toLowerCase();
    List<VerseModel> verses = HiveBoxes.verseBox.values.where((verse) {
      String arabic = verse.plain;
      if (lang == 'uz') {
        String transcription = verse.transcriptionUz.toLowerCase();
        String meaning = verse.meaningUz.toLowerCase();

        if (arabic.contains(q) ||
            transcription.contains(q) ||
            meaning.contains(q)) {
          return true;
        }
      } else {
        String transcription = verse.transcription.toLowerCase();
        String meaning = verse.meaning.toLowerCase();

        if (arabic.contains(q) ||
            transcription.contains(q) ||
            meaning.contains(q)) {
          return true;
        }
      }
      return false;
    }).toList();
    if (verses.isEmpty) {
      return Container(
        color: AppColors.background,
        alignment: Alignment.center,
        child: Text(
          AppStrings.notFound.tr(),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    return Material(
      color: AppColors.background,
      child: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: verses.length,
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemBuilder: (context, index) {
          VerseModel verse = verses[index];
          return FoundedVerseTile(query: query, verse: verse);
        },
      ),
    );
  }
}
