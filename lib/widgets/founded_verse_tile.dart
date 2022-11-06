import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/widgets.dart';

class FoundedVerseTile extends StatelessWidget {
  final VerseModel verse;
  final String query;
  const FoundedVerseTile({
    super.key,
    required this.query,
    required this.verse,
  });

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
                    key: AppKeys.share,
                    icon: Icons.share,
                    onPressed: _onShare,
                  ),

                  SizedBox(width: 12.w),

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
                  SizedBox(width: 12.w),

                  // PLAY
                  BlocBuilder<PlayerBloc, PlayingState>(
                    builder: (context, state) {
                      bool isPlaying = (state is PlayerPlayingState) &&
                          state.id == verse.verseId;
                      return RoundedIconButton(
                        key: AppKeys.play,
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

  List<TextSpan> _highlightOccurrences() {
    TextStyle simpleStyle = TextStyle();
    TextStyle highlightedStyle = TextStyle(fontWeight: FontWeight.w600);

    String source = _getSource();

    if (!source.toLowerCase().contains(query.toLowerCase())) {
      return [
        TextSpan(text: source, style: simpleStyle),
      ];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.start),
            style: simpleStyle,
          ),
        );
      }

      children.add(
        TextSpan(
          text: source.substring(match.start, match.end),
          style: highlightedStyle,
        ),
      );

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(
          TextSpan(
            text: source.substring(match.end, source.length),
            style: simpleStyle,
          ),
        );
      }

      lastMatchEnd = match.end;
    }
    return children;
  }

  String _getSource() {
    String uz = '${verse.transcriptionUz}\n\n${verse.meaningUz}';
    String cr = '${verse.transcription}\n\n${verse.meaning}';
    return AppPrefs.locale == 'uz' ? uz : cr;
  }
}
