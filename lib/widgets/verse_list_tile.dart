import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/audio/audio_bloc.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/highlight_text.dart';
import 'package:yaaseen/widgets/widgets.dart';

class VerseListTile extends StatelessWidget {
  final VerseModel verse;
  const VerseListTile({Key? key, required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc sizeBloc = context.watch();
    AppFormatter formatter = AppFormatter();
    final number = formatter.numberFormat(verse.verseId);
    final formatted = '\uFD3F$number\uFD3E';

    return ValueListenableBuilder(
      valueListenable: HiveBoxes.verseBox.listenable(keys: [verse.key]),
      builder: (context, box, w) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ARABIC
              ArabicText(
                arabic: '${verse.arabic} $formatted',
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20.0),

              // TRANSCRIPTION
              Text(
                _getTranscription,
                style: TextStyle(
                  fontSize: sizeBloc.trSize,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 10.0),

              // MEAINGS
              // Text(
              //   '${verse.verseId}. $_getMeaning',
              //   style: TextStyle(fontSize: sizeBloc.meaingSize),
              // ),

              HighlightText(
                source: '${verse.verseId}. $_getMeaning',
                target: '${verse.verseId} - oyat',
                pattern: RegExp(r'\(.*\)'),
                simpleStyle: TextStyle(
                  fontSize: sizeBloc.meaningSize,
                  fontWeight: FontWeight.w600,
                ),
                highlightStyle: TextStyle(fontSize: sizeBloc.meaningSize),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SHARE
                  RoundedIconButton(
                    key: AppKeys.share,
                    icon: Icons.share,
                    onPressed: _onShare,
                  ),

                  const SizedBox(width: 12.0),

                  // SAVE
                  RoundedIconButton(
                    key: AppKeys.bookmark,
                    icon:
                        verse.isSaved ? Icons.bookmark : Icons.bookmark_border,
                    onPressed: () async {
                      verse.isSaved = !verse.isSaved;
                      await verse.save();
                    },
                  ),
                  const SizedBox(width: 12.0),

                  // PLAY
                  BlocBuilder<PlayerBloc, PlayingState>(
                    builder: (context, state) {
                      bool isPlaying = (state is PlayerPlayingState) &&
                          state.id == verse.verseId;
                      return RoundedIconButton(
                        key: AppKeys.play,
                        icon: isPlaying ? Icons.pause : Icons.play_arrow,
                        onPressed: () async {
                          BlocProvider.of<AudioBloc>(context).add(
                            AudioEvent.played(index: verse.id),
                          );
                          // PlayerBloc playerBloc = BlocProvider.of(context);

                          // if (isPlaying) {
                          //   playerBloc.add(PauseAudioEvent());
                          // } else {
                          //   playerBloc.add(PlayAudioEvent(verse.verseId));
                          // }
                        },
                      );
                    },
                  )
                ],
              )
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

  Future<void> _onShare() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(verse);
    Share.share(clipboardText);
  }
}
