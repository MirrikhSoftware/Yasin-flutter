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
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutQuad,
        color: const Color.fromARGB(255, 245, 245, 245),
        height: 60.0,
        child: Column(
          children: [
            const Divider(height: 1.0, thickness: 1.0),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppStrings.app_name.tr()} $id-${AppStrings.verse.tr()}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      AppStrings.afasy.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const Spacer(),
                AppIconButton(
                  icon: Icons.skip_previous,
                  onPressed: () => playerBloc.add(PlayerPrevEvent()),
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
                  onPressed: () => playerBloc.add(PlayerNextEvent()),
                ),
                AppIconButton(
                  icon: Icons.stop,
                  onPressed: () {
                    playerBloc.add(PlayerStopEvent());
                  },
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      );
    });
  }
}
