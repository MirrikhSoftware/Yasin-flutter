/*

  Created by: Bakhromjon Polat
  Created on: Jan 01 2024 15:16:50
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/audio/audio_bloc.dart';
import 'package:yaaseen/core/constants/enums.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

import 'rounded_icon_button.dart';

class PlayerButtons extends StatelessWidget {
  final VerseModel verse;
  const PlayerButtons({super.key, required this.verse});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          icon: verse.isSaved ? Icons.bookmark : Icons.bookmark_border,
          onPressed: () async {
            verse.isSaved = !verse.isSaved;
            await verse.save();
          },
        ),
        const SizedBox(width: 12.0),

        // PLAY
        BlocBuilder<AudioBloc, AudioState>(
          builder: (context, state) {
            final isPlaying = state.currentPlaying == verse.verseId &&
                state.status == PlayerStatus.playing;
            return RoundedIconButton(
              // width: 120,
              key: AppKeys.play,
              icon: isPlaying ? Icons.pause : Icons.play_arrow,
              onPressed: () {
                BlocProvider.of<AudioBloc>(context).add(
                  AudioEvent.played(index: verse.verseId),
                );
              },
            );
          },
        )
      ],
    );
  }

  Future<void> _onShare() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(verse);
    Share.share(clipboardText);
  }
}
