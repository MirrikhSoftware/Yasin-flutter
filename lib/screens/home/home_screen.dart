import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/audio/audio_bloc.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/services/services.dart';
import 'package:yaaseen/widgets/widgets.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: AppPref.scrollOffset);

  final List<GlobalKey> _keys = [];
  final List<VerseModel> verses = HiveBoxes.verseBox.values.toList();
  @override
  void initState() {
    super.initState();

    AnalyticsService.analytics.log(name: 'HomeScreen');

    _keys.addAll(List.generate(83, (index) => GlobalKey()));

    _scrollController.addListener(() async {
      await AppPref.setScrollOffset(_scrollController.offset);
    });

    PlayerBloc playerBloc = BlocProvider.of(context);
    playerBloc.add(PlayerGlobalKeysEvent(_keys));
    playerBloc.player.onPlayerComplete.listen((event) {
      int id = playerBloc.playingId;

      if (id < 83) {
        playerBloc.add(PlayAudioEvent(id + 1));
      } else {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(seconds: 3),
          curve: Curves.easeIn,
        );

        playerBloc.add(PlayerStopEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioBloc, AudioState>(
      listener: (context, state) {
        print(state.status);
        print(state.currentPlaying);
      },
      builder: (context, state) {
        return Scaffold(
          drawer: const AppDrawer(),
          bottomNavigationBar: const PlayerTab(),
          body: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: true,
                title: Text(AppStrings.app_name.tr()),
                actions: [
                  AppIconButton(
                    icon: CupertinoIcons.search,
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: AppSearchDelegate(),
                      );
                    },
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SvgPicture.asset(
                    AppIcons.basmalah,
                    colorFilter: const ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final int itemIndex = index ~/ 2;
                    if (index.isEven) {
                      VerseModel verse = verses[itemIndex];
                      GlobalKey key = _keys[itemIndex];
                      return VerseListTile(key: key, verse: verse);
                    }
                    return const Divider(thickness: 1.0, height: 24.0);
                  },
                  childCount: math.max(0, verses.length * 2 - 1),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24.0))
            ],
          ),
        );
      },
    );
  }
}
