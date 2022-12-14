import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      ScrollController(initialScrollOffset: AppPrefs.srcollOffset);

  final List<GlobalKey> _keys = [];
  final List<VerseModel> verses = HiveBoxes.verseBox.values.toList();
  @override
  void initState() {
    super.initState();

    AnalyticsService.analytics.log(name: 'HomeScreen');

    _keys.addAll(List.generate(83, (index) => GlobalKey()));

    _scrollController.addListener(() async {
      await AppPrefs.setScrollOffset(_scrollController.offset);
    });

    PlayerBloc playerBloc = BlocProvider.of(context);
    playerBloc.add(PlayerGlobalKeysEvent(_keys));
    playerBloc.player.onPlayerComplete.listen((event) {
      int id = playerBloc.playingId;

      if (id < 83) {
        playerBloc.add(PlayAudioEvent(id + 1));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(top: 20.h),
              child: SvgPicture.asset(
                AppIcons.basmalah,
                color: AppColors.black,
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
                return Divider(thickness: 1.h, height: 24.h);
              },
              childCount: math.max(0, verses.length * 2 - 1),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24.h))
        ],
      ),
    );
  }
}
