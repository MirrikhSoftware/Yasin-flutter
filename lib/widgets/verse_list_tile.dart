import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/highlight_text.dart';
import 'package:yaaseen/widgets/player_buttons.dart';
import 'package:yaaseen/widgets/widgets.dart';

class VerseListTile extends StatelessWidget {
  final VerseModel verse;
  const VerseListTile({super.key, required this.verse});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.watch<SettingsBloc>().state;
    final formatter = AppFormatter();
    final number = formatter.numberFormat(verse.verseId);
    final formatted = '\uFD3F$number\uFD3E';

    return ValueListenableBuilder(
      valueListenable: HiveBoxes.verseBox.listenable(keys: [verse.key]),
      builder: (context, box, w) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ARABIC

              if (settingsBloc.showArabic) ...{
                ArabicText(
                  fontFamily: 'Me-Quran2',
                  arabic: '${verse.arabic} $formatted',
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20.0),
              },

              // TRANSCRIPTION

              if (settingsBloc.showTranscription) ...{
                Text(
                  _getTranscription,
                  style: TextStyle(
                    fontSize: settingsBloc.transcriptionSize,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 10.0),
              },

              // MEAINGS
              // Text(
              //   '${verse.verseId}. $_getMeaning',
              //   style: TextStyle(fontSize: sizeBloc.meaingSize),
              // ),

              if (settingsBloc.showMeaning) ...{
                HighlightText(
                  source: '${verse.verseId}. $_getMeaning',
                  target: '${verse.verseId} - oyat',
                  pattern: RegExp(r'\(.*\)'),
                  simpleStyle: TextStyle(
                    fontSize: settingsBloc.meaningSize,
                    fontWeight: FontWeight.w600,
                  ),
                  highlightStyle: TextStyle(fontSize: settingsBloc.meaningSize),
                ),
                const SizedBox(height: 12.0),
              },

              PlayerButtons(verse: verse),
            ],
          ),
        );
      },
    );
  }

  String get _getMeaning => AppPref.locale == 'uz'
      ? verse.meaningUz.toString()
      : verse.meaning.toString();
  String get _getTranscription => AppPref.locale == 'uz'
      ? verse.transcriptionUz.toString()
      : verse.transcription.toString();
}
