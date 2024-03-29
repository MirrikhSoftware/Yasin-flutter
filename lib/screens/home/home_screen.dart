import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:yaaseen/bloc/audio/audio_bloc.dart';
import 'package:yaaseen/core/constants/enums.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/settings_popup.dart';
import 'package:yaaseen/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ItemScrollController scrollController;

  final verses = HiveBoxes.verseBox.values.toList();
  late final int initialIndex;

  @override
  void initState() {
    super.initState();
    scrollController = ItemScrollController();
    initialIndex = AppPref.lastPlaying;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioBloc, AudioState>(
      listenWhen: (previous, current) =>
          previous.currentPlaying != current.currentPlaying &&
          current.status != PlayerStatus.stop,
      listener: (context, state) {
        final index = state.currentPlaying;

        scrollController.scrollTo(
          index: index == 0 ? index : index - 1,
          duration: const Duration(milliseconds: 300),
        );
        AppPref.setLastPlaying(index);
      },
      builder: (context, state) {
        return Scaffold(
          drawer: const AppDrawer(),
          bottomNavigationBar: const PlayerTab(),
          appBar: AppBar(
            title: Text(AppStrings.app_name.tr()),
            actions: [
              IconButton(
                icon: const Icon(CupertinoIcons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: AppSearchDelegate((verseId) {
                      scrollController.scrollTo(
                        index: verseId - 1,
                        duration: const Duration(milliseconds: 200),
                      );
                    }),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SettingsPopup(
                      onLocaleChanged: (value) async {
                        await AppPref.setLocale(value);
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          body: ScrollablePositionedList.separated(
            itemScrollController: scrollController,
            itemCount: verses.length,
            initialScrollIndex: initialIndex,
            padding: const EdgeInsets.symmetric(vertical: 24),
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(height: 1.0),
            itemBuilder: (context, index) {
              VerseModel verse = verses[index];
              if (index == 0) {
                return Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.basmalah,
                      colorFilter: const ColorFilter.mode(
                        AppColors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    VerseListTile(verse: verse),
                  ],
                );
              }
              return VerseListTile(verse: verse);
            },
          ),
        );
      },
    );
  }
}
