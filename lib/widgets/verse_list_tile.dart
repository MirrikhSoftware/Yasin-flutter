import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/services/media_player.dart';
import 'package:yaaseen/widgets/widgets.dart';
import 'rounded_icon_button.dart';

class VerseListTile extends StatefulWidget {
  final VerseModel verse;
  const VerseListTile({Key? key, required this.verse}) : super(key: key);

  @override
  State<VerseListTile> createState() => _VerseListTileState();
}

class _VerseListTileState extends State<VerseListTile> {
  AudioPlayer _player = AudioPlayer();
  late final VerseModel _verse = widget.verse;
  AppFormatter formatter = AppFormatter();
  late String number = formatter.numberFormat(_verse.verseId!);
  late String formatted = '\uFD3F$number\uFD3E';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ARABIC
          ArabicText(arabic: '${widget.verse.arabic} $formatted'),
          SizedBox(height: 20.h),

          // TRANSCRIPTION
          Text(
            _getTranscription,
            style: TextStyle(
                fontSize: AppPrefs.trSize,
                fontStyle: FontStyle.italic,
                letterSpacing: 2),
          ),

          SizedBox(height: 10.h),

          // MEAINGS
          Text(
            '${_verse.verseId}. $_getMeaning',
            style: TextStyle(fontSize: AppPrefs.meaningSize),
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
                icon: _verse.isSaved ? Icons.bookmark : Icons.bookmark_border,
                onPressed: () async {
                  widget.verse.isSaved = !_verse.isSaved;
                  await widget.verse.save();
                },
              ),
              SizedBox(width: 12.w),

              // PLAY
              RoundedIconButton(
                icon: Icons.play_arrow,
                onPressed: () async {
                  String id = '${_verse.verseId}'.padLeft(2, '0');
                  String path = 'assets/audio/yasin$id.mp3';
                  var bytes = await rootBundle.load(path);

                  // _player.play(BytesSource(bytes.buffer.asUint8List()));
                  MediaPlayer.play(path);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  String get _getMeaning => AppPrefs.locale == 'uz'
      ? _verse.meaningUz.toString()
      : _verse.meaning.toString();
  String get _getTranscription => AppPrefs.locale == 'uz'
      ? _verse.transcriptionUz.toString()
      : _verse.transcription.toString();

  Future<void> _onShare() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(_verse);
    Share.share(clipboardText);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
