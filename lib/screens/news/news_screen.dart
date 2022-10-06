/*
    CREATED BY: BAKHROMJON POLAT
    CREATED AT: Sep 28 2022 12:09

    Github: https://github.com/BahromjonPolat
    Linked In: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: News list screen

*/

import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/models.dart';
import 'package:yaaseen/screens/news/news.dart';
import 'package:yaaseen/widgets/widgets.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    NewsBloc newsBloc = BlocProvider.of(context);
    newsBloc.add(NewsLoadedEvent());
    // AppPrefs.setNotification(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: SimpleAppBar(title: AppStrings.news.tr()),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.newsBox.listenable(),
        builder: (context, Box<NewsModel> box, child) {
          List<NewsModel> newsList =
              box.values.where((news) => news.status == 'active').toList();
          return RefreshIndicator(
            onRefresh: () async {
              NewsBloc newsBloc = BlocProvider.of(context);
              newsBloc.add(NewsLoadedEvent());
            },
            child: ListView.builder(
              itemCount: newsList.length,
              // itemCount: MockData.mockNewsList.length,
              itemBuilder: (context, index) {
                NewsModel news = newsList[index];
                // NewsModel news = MockData.mockNewsList[index];
                return _showNews(news);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _showNews(NewsModel news) => Card(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        // decoration: AppShape.simple(color: AppColors.white),
        // padding: EdgeInsets.only(bottom: 11.h),
        shape: AppShapes.circularBorder(radius: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 7.h),

            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: AppImage(
                image: news.images!.first,
                height: 410.h,
                width: 410.w,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                _setDate(news.date ?? DateTime.now().millisecondsSinceEpoch),

                SizedBox(height: 12.h),
                // TITLE
                _setTitle(news.title.toString()),

                SizedBox(height: 7.h),

                // _setText(_getDescription(news), maxLines: 2),
              ],
            ).symmetricPadding(h: 14)
          ],
        ),
      ).onClick(() {
        NewsBloc newsBloc = BlocProvider.of(context);
        newsBloc.add(NewsSelectedEvent(news));
        // AppNavigator.pushNamed(RouteNames.NEWS_DETAILS);
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) => const NewsDetailsScreen());
      });

  Text _setTitle(String title, {double size = 18}) {
    return Text(
      title,
      style: AppTextStyle.medium(size: size),
    );
  }

  Text _setText(String data, {int? maxLines}) => Text(data, maxLines: maxLines);

  Text _setDate(num date) => _setText(
        AppFormatter.formatDateFromMills(date, pattern: '##.##'),
      );
}
