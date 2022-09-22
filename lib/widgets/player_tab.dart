import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/player/player_bloc.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/widgets/widgets.dart';

class PlayerTab extends StatelessWidget {
  const PlayerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayingState>(builder: (context, state) {
      PlayerBloc bloc = BlocProvider.of(context);
      int id = bloc.playingId;
      if (id == 0) {
        return const SizedBox();
      }
      return SizedBox(
        height: 70.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Divider(height: 1.h, color: AppColors.green, thickness: 1.h),
            Text(
              'Yosin surasi $id-oyat',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Text(
              'Mishary bin al-Afasy',
              // style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedIconButton(
                  icon: Icons.skip_previous,
                  onPressed: () {},
                ),
                SizedBox(width: 12.w),
                RoundedIconButton(
                  icon: Icons.play_arrow,
                  onPressed: () {},
                ),
                SizedBox(width: 12.w),
                RoundedIconButton(
                  icon: Icons.skip_next,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
