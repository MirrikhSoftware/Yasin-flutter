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
import 'package:yaaseen/screens/test/firestore_service.dart';
import 'package:yaaseen/app_types.dart';
import 'package:yaaseen/services/notification_service.dart';
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
    NotificationService.hasNotification = false;
    // AppPrefs.setNotification(false);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: StreamBuilder(
    //     stream: FirestoreService().getNews(),
    //     builder: (context, AsyncSnapshot<QueryMap> snapshot) {
    //       if (snapshot.hasData) {
    //         QueryMap query = snapshot.requireData;
    //         return ListView.builder(
    //           itemCount: query.docs.length,
    //           itemBuilder: (context, index) {
    //             QueryDoc doc = query.docs[index];

    //             return  ListTile(
    //               title: Text(doc.data().toString()),
    //             );
    //           },
    //         );
    //       }

    //       return const SizedBox();
    //     },
    //   ),
    // );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: SimpleAppBar(title: AppStrings.news.tr()),
      body: StreamBuilder(
        stream: FirestoreService().getNews(),
        builder: (context, AsyncSnapshot<QueryMap> snap) {
          if (snap.hasData) {
            List<QueryDoc> docs = snap.requireData.docs;
            return ListView.builder(
              itemCount: docs.length,
              // itemCount: MockData.mockNewsList.length,
              itemBuilder: (context, index) {
                QueryDoc doc = docs[index];
                NewsModel news = NewsModel.fromJson(doc.data());
                // NewsModel news = MockData.mockNewsList[index];
                return _showNews(news);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _showNews(NewsModel news) => Card(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        // decoration: AppShape.simple(color: AppColors.white),
        // padding: EdgeInsets.only(bottom: 11.h),
        // shape: AppShapes.circularBorder(radius: 10),
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
              // child: AppImage(
              //   image: news.images!.first,
              //   height: 410.h,
              //   width: 410.w,
              // ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                // _setDate(news.date ?? DateTime.now().millisecondsSinceEpoch),

                SizedBox(height: 12.h),
                // TITLE
                // _setTitle(news.title.toString()),

                SizedBox(height: 7.h),

                // _setText(_getDescription(news), maxLines: 2),
              ],
            )
            // .symmetricPadding(h: 14)
          ],
        ),
      )
      // .onClick(() {
      //   NewsBloc newsBloc = BlocProvider.of(context);
      //   newsBloc.add(NewsSelectedEvent(news));
      //   // AppNavigator.pushNamed(RouteNames.NEWS_DETAILS);
      //   showModalBottomSheet(
      //       isScrollControlled: true,
      //       backgroundColor: Colors.transparent,
      //       context: context,
      //       builder: (_) => const NewsDetailsScreen());
      // });
      ;
  Text _setTitle(String title, {double size = 18}) {
    return Text(
      title,
      // style: AppTextStyle.medium(size: size),
    );
  }

  Text _setText(String data, {int? maxLines}) => Text(data, maxLines: maxLines);

  Text _setDate(num date) => _setText(
        "AppFormatter.formatDateFromMills(date, pattern: '##.##')",
      );
}
