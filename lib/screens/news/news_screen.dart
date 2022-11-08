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
import 'package:yaaseen/models/models.dart';
import 'package:yaaseen/route/routes.dart';
import 'package:yaaseen/screens/news/news.dart';
import 'package:yaaseen/screens/test/firestore_service.dart';
import 'package:yaaseen/app_types.dart';
import 'package:yaaseen/widgets/widgets.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final AppFormatter _formatter = AppFormatter();
  @override
  void initState() {
    super.initState();
    // NewsBloc newsBloc = BlocProvider.of(context);
    // newsBloc.add(NewsLoadedEvent());
    // NotificationService.hasNotification = false;
    // AppPrefs.setNotification(false);
  }

  @override
  Widget build(BuildContext context) {
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

            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: AppImage(
                image: news.images!.first,
                height: 220.h,
                width: 375.w,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      _setText(
                        _formatter.formatDate(news.createdAt!.toDate()),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 16.0,
                      ),
                      SizedBox(width: 4.w),
                      _setText(news.shown!.length.toString())
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ).onClick(() {
        NewsBloc newsBloc = BlocProvider.of(context);
        newsBloc.add(NewsSelectedEvent(news));
        AppNavigator.push(const NewsDetailsScreen());
      });

  Text _setText(String text) => Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      );
}
