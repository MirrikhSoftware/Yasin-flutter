import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/services/media_player.dart';

import 'rounded_icon_button.dart';

class VerseListTile extends StatefulWidget {
  final VerseModel verse;
  const VerseListTile({Key? key, required this.verse}) : super(key: key);

  @override
  State<VerseListTile> createState() => _VerseListTileState();
}

class _VerseListTileState extends State<VerseListTile> {
  static AudioPlayer? _player;
  AppFormatter formatter = AppFormatter();
  late final VerseModel _verse = widget.verse;
  late String number = formatter.numberFormat(_verse.verseId!);
  late String formatted = '\uFD3F$number\uFD3E';

  @override
  void initState() {
    super.initState();
    // _player.onPlayerStateChanged.listen((event) => setState(() {
    //       _isPlaying = event == PlayerState.playing;
    //     }));
    // _player.onPlayerComplete
    //     .listen((event) => setState(() => _isPlaying = false));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${widget.verse.arabic!.replaceFirst('\n', '')} $formatted',
              textAlign: TextAlign.start,
              locale: const Locale('ar'),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 32,
                fontFamily: AppFonts.meQuran,
                wordSpacing: 12,
                height: 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '${_verse.verseId}. ${_verse.meaning}',
            style: const TextStyle(
              fontSize: 18,
            ),
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
                  var byteData = await rootBundle.load(path);

                  Uint8List bytes = byteData.buffer.asUint8List();
                  MediaPlayer.play(path);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  // Future<void> _onCopyPressed() async {
  //   AppFormatter formatter = AppFormatter();
  //   String clipboardText = formatter.formatClipboard(_verse);
  //   await Clipboard.setData(ClipboardData(text: clipboardText));
  // }

  Future<void> _onShare() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(_verse);
    Share.share(clipboardText);
  }

  @override
  void dispose() {
    super.dispose();
    _player?.dispose();
  }
}
