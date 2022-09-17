import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
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
  bool _pinned = true;
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      await AppPrefs.setScrollOffset(_scrollController.offset);
      if (_pinned) {
        setState(() {
          _pinned = false;
        });
      }
    });

    HiveBoxes.langBox.listenable().addListener(() => setState(() {}));

    PlayerBloc playerBloc = BlocProvider.of(context);
    playerBloc.player?.onPlayerComplete.listen((event) {
      playerBloc.add(PauseAudioEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.verseBox.listenable(),
        builder: (context, Box<VerseModel> box, child) {
          List<VerseModel> verses = box.values.toList();
          return CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: _pinned,
                title: Text(AppStrings.app_name.tr()),
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
                      VerseModel verse = box.getAt(itemIndex)!;
                      return VerseListTile(verse: verse);
                    }
                    return Divider(thickness: 1.h, height: 24.h);
                  },
                  childCount: math.max(0, verses.length * 2 - 1),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h))
            ],
          );
        },
      ),
    );
  }
}
