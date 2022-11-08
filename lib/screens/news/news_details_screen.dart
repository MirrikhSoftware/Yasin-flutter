import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/models/models.dart';
import 'package:yaaseen/screens/test/firestore_service.dart';
import 'package:yaaseen/widgets/widgets.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  late NewsModel news;



  final AppFormatter _formatter = AppFormatter();

  @override
  void initState() {
    super.initState();
    news = BlocProvider.of<NewsBloc>(context).news;
    FirestoreService().setShowList(news);
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.green,
            pinned: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            expandedHeight: 220.h - kToolbarHeight,
            toolbarHeight: kToolbarHeight,
            flexibleSpace: _showImages(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
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
                          _formatter
                              .formatDate(news.createdAt!.toDate()),
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
              Html(data: news.body)
            ]),
          )
        ],
      ),
    );
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
                height: 220.h,
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
                            height: 220.h,
                            width: 375.w,
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
                    style: const TextStyle(color: AppColors.white),
                  ),
                ).visibility(visible: news.images!.length > 1),
              )
            ],
          );
        },
      ),
    );
  }

  Text _setText(String text) => Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      );
}
