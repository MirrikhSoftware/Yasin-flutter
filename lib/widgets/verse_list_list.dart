import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

import 'rounded_icon_button.dart';

class VerseListTile extends StatefulWidget {
  final VerseModel verse;
  const VerseListTile({Key? key, required this.verse}) : super(key: key);

  @override
  State<VerseListTile> createState() => _VerseListTileState();
}

class _VerseListTileState extends State<VerseListTile> {
  final AudioPlayer _player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppFormatter formatter = AppFormatter();
    String number = formatter.numberFormat(widget.verse.verseId!);
    String formatted = '\uFD3F$number\uFD3E';
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
            '${widget.verse.verseId}. ${widget.verse.meaning}',
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
                icon: widget.verse.isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                onPressed: () async {
                  widget.verse.isSaved = !widget.verse.isSaved;
                  await widget.verse.save();
                },
              ),
              SizedBox(width: 12.w),

              // PLAY
              RoundedIconButton(
                icon: Icons.play_arrow,
                onPressed: () async {
                  String id = '${widget.verse.verseId}'.padLeft(2, '0');
                  String path = 'assets/audio/yasin$id.mp3';
                  // await player.setSourceAsset('assets/audio/yasin00.mp3');
                  var byteData = await rootBundle.load(path);
                  Uint8List bytes = byteData.buffer.asUint8List();
                  await _player.play(BytesSource(bytes));
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _onCopyPressed() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(widget.verse);
    await Clipboard.setData(ClipboardData(text: clipboardText));
  }

  Future<void> _onShare() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(widget.verse);
    Share.share(clipboardText);

    // var data = await Clipboard.getData(Clipboard.kTextPlain);
    // print(data?.text);
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }
}
