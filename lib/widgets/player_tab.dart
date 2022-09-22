import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/player/player_bloc.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/widgets/widgets.dart';

class PlayerTab extends StatelessWidget {
  const PlayerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayingState>(builder: (context, state) {
      PlayerBloc playerBloc = BlocProvider.of(context);
      int id = playerBloc.playingId;
      if (id == 0) {
        return const SizedBox();
      }

      bool isPlaying = state is PlayerPlayingState;
      return Container(
        color: const Color.fromARGB(255, 255, 248, 210),
        height: 60.h,
        child: Row(
          children: [
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Yosin surasi $id-oyat',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const Text(
                  'Mishary bin al-Afasy',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),

            const Spacer(),
            AppIconButton(
              icon: Icons.skip_previous,
              onPressed: () {},
            ),
            // SizedBox(width: 12.w),
            AppIconButton(
              icon: isPlaying ? Icons.pause : Icons.play_arrow,
              onPressed: () {
                if (isPlaying) {
                  playerBloc.add(PauseAudioEvent());
                } else {
                  playerBloc.add(PlayAudioEvent(id));
                }
              },
            ),
            // SizedBox(width: 12.w),
            AppIconButton(
              icon: Icons.skip_next,
              onPressed: () {},
            ),
            AppIconButton(
              icon: Icons.stop,
              onPressed: () {},
            ),
          ],
        ),
      );
    });
  }
}
