import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/widgets.dart';

class VerseListTile extends StatelessWidget {
  final VerseModel verse;
  const VerseListTile({Key? key, required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppFormatter formatter = AppFormatter();
    late String number = formatter.numberFormat(verse.verseId!);
    late String formatted = '\uFD3F$number\uFD3E';

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        SettingsBloc sizeBloc = context.watch();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ARABIC
              ArabicText(arabic: '${verse.arabic} $formatted'),
              SizedBox(height: 20.h),

              // TRANSCRIPTION
              Text(
                _getTranscription,
                style: TextStyle(
                  fontSize: sizeBloc.trSize,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                ),
              ),

              SizedBox(height: 10.h),

              // MEAINGS
              Text(
                '${verse.verseId}. $_getMeaning',
                style: TextStyle(fontSize: sizeBloc.meaingSize),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SHARE
                  RoundedIconButton(
                    icon: Icons.share,
                    onPressed: _onShare,
                  ),

                  SizedBox(width: 12.w),

                  // SAVE
                  RoundedIconButton(
                    icon:
                        verse.isSaved ? Icons.bookmark : Icons.bookmark_border,
                    onPressed: () async {
                      verse.isSaved = !verse.isSaved;
                      await verse.save();
                    },
                  ),
                  SizedBox(width: 12.w),

                  // PLAY
                  BlocBuilder<PlayerBloc, PlayingState>(
                    builder: (context, state) {
                      bool isPlaying = (state is PlayerPlayingState) &&
                          state.id == verse.verseId;
                      return RoundedIconButton(
                        icon: isPlaying ? Icons.pause : Icons.play_arrow,
                        onPressed: () async {
                          PlayerBloc playerBloc = BlocProvider.of(context);

                          if (isPlaying) {
                            playerBloc.add(PauseAudioEvent());
                          } else {
                            playerBloc.add(PlayAudioEvent(verse.verseId!));
                          }
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

  String get _getMeaning => AppPrefs.locale == 'uz'
      ? verse.meaningUz.toString()
      : verse.meaning.toString();
  String get _getTranscription => AppPrefs.locale == 'uz'
      ? verse.transcriptionUz.toString()
      : verse.transcription.toString();

  Future<void> _onShare() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(verse);
    Share.share(clipboardText);
  }
}
