import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/audio/audio_bloc.dart';
import 'package:yaaseen/core/constants/enums.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/widgets/widgets.dart';

class PlayerTab extends StatelessWidget {
  const PlayerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final audioBloc = BlocProvider.of<AudioBloc>(context);
          int id = state.currentPlaying;

          if (state.status == PlayerStatus.stop) {
            return const SizedBox();
          }

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
                          id == 0
                              ? ''
                              : '${AppStrings.app_name.tr()} $id-${AppStrings.verse.tr()}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
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
                      onPressed: () =>
                          audioBloc.add(const AudioEvent.toPrevious()),
                    ),
                    const SizedBox(width: 12.0),
                    AppIconButton(
                      icon: state.status == PlayerStatus.playing
                          ? Icons.pause
                          : Icons.play_arrow,
                      onPressed: () {
                        if (state.status == PlayerStatus.playing) {
                          audioBloc.add(const AudioEvent.paused());
                        } else {
                          audioBloc.add(const AudioEvent.played());
                        }
                      },
                    ),
                    const SizedBox(width: 12.0),
                    AppIconButton(
                      icon: Icons.skip_next,
                      onPressed: () => audioBloc.add(const AudioEvent.toNext()),
                    ),
                    AppIconButton(
                      icon: Icons.stop,
                      onPressed: () =>
                          audioBloc.add(const AudioEvent.stopped()),
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
