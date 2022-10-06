

import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/models/models.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  late NewsModel news;
  @override
  void initState() {
    super.initState();
    news = BlocProvider.of<NewsBloc>(context).news;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        initialChildSize: .7,
        minChildSize: .6,
        maxChildSize: 1.0,
        
        builder: (context, controller) {
          return Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            color: AppColors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              controller: controller,
              physics: const ClampingScrollPhysics(),
              children: [
                _showImages(),
                SizedBox(height: 12.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppFormatter.formatDateFromMills(
                        news.date ?? DateTime.now().millisecondsSinceEpoch,
                        pattern: '##.##',
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      news.title.toString(),
                      style: AppTextStyle.medium(size: 22),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ).symmetricPadding(h: 8),
                Html(data: news.hTMLText),
              ],
            ),
          );
        });
  }

  Widget _showImages() {
    return BlocProvider(
      create: (context) => NewsImageBloc(),
      child: BlocBuilder<NewsImageBloc, NewsImageState>(
        builder: (context, state) {
          NewsImageBloc imageBloc = BlocProvider.of(context);
          return Stack(
            children: [
              SizedBox(
                height: 410.h,
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (i) =>
                      imageBloc.add(NewsImageIndexChangedEvent(i)),
                  children: news.images!
                      .map(
                        (e) => ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          child: AppImage(
                            image: e,
                            height: 410.h,
                            width: 410.w,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Positioned(
                right: 12.w,
                bottom: 12.h,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: AppShape.simple(
                    color: Colors.black26,
                    radius: 24.r,
                  ),
                  child: Text(
                    '${state.index + 1}/${news.images!.length}',
                    style: AppTextStyle.medium(color: AppColors.white),
                  ),
                ).visibility(visible: news.images!.length > 1),
              )
            ],
          );
        },
      ),
    );
  }
}
