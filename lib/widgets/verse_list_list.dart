
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

import 'rounded_icon_button.dart';

class VerseListTile extends StatelessWidget {
  final VerseModel verse;
  const VerseListTile({Key? key, required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppFormatter formatter = AppFormatter();
    String number = formatter.numberFormat(verse.verseId!);
    String formatted = '\uFD3F$number\uFD3E';
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${verse.arabic!.replaceFirst('\n', '')} $formatted',
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
            '${verse.verseId}. ${verse.meaning}',
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

              // COPY
              RoundedIconButton(
                icon: Icons.copy,
                onPressed: _onCopyPressed,
              ),
              SizedBox(width: 12.w),

              // SAVE
              RoundedIconButton(
                icon: verse.isSaved ? Icons.bookmark : Icons.bookmark_border,
                onPressed: () async {
                  verse.isSaved = !verse.isSaved;
                  await verse.save();
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
    String clipboardText = formatter.formatClipboard(verse);
    await Clipboard.setData(ClipboardData(text: clipboardText));
  }

  Future<void> _onShare() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(verse);
    Share.share(clipboardText);
    

    
    // var data = await Clipboard.getData(Clipboard.kTextPlain);
    // print(data?.text);
  }
}