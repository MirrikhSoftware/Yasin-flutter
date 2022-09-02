import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();

    HiveBoxes.prefsBox.listenable().addListener(() { 
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.verseBox.listenable(),
        builder: (context, Box<VerseModel> box, child) {
          List<VerseModel> verses = box.values.toList();
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const HomeAppBar(),

              SliverToBoxAdapter(
                child: Scrollbar(
                  controller: _scrollController,
                  child: ListView.separated(
                    controller: _scrollController,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: verses.length,
                    separatorBuilder: (ctx, i) => const Divider(),
                    itemBuilder: (context, index) {
                      VerseModel verse = verses[index];
                      return VerseListTile(verse: verse);
                    },
                  ),
                ),
              ),
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (context, index) {
              //       final int itemIndex = index ~/ 2;
              //       if (index.isEven) {
              //         VerseModel verse = box.getAt(itemIndex)!;
              //         return VerseListTile(verse: verse);
              //       }
              //       return Divider(thickness: 1.h, height: 24.h);
              //     },
              //     childCount: math.max(0, verses.length * 2 - 1),
              //   ),
              // ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h))
            ],
          );
        },
      ),
    );
  }

}
