import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/widgets.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.verseBox.listenable(),
        builder: (context, Box<VerseModel> box, child) {

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: true,
                title: Text('Yosin'),
              ),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
              //     child: SvgPicture.asset(
              //       AppImages.basmalah,
              //       color: AppColors.black,
              //     ),
              //   ),
              // ),
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
