
import 'dart:async';

import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/services/http_result.dart';
import 'package:yaaseen/services/services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  late NewsModel _news;
  final List<NewsModel> _newsList = [];
  late List<NewsModel> _oldNews;
  int _page = 1;
  NewsBloc() : super(NewsInitial()) {
    _oldNews = NewsHelper.newsList;
    on<NewsLoadedEvent>(_getNews);
    on<NewsGetByIdEvent>(_getNewsById);
    on<NewsSelectedEvent>(_selectNews);
    on<BannerLoadedEvent>(_getBanners);
  }

  FutureOr<void> _getNews(
    NewsLoadedEvent event,
    Emitter<NewsState> emit,
  ) async {
    while (true) {
      HttpResult result = await ApiService.getNews(page: _page);
      if (result.isSuccess) {
        _page++;
        NewsData newsData = NewsData.fromJson(result.result);
        _newsList.addAll(newsData.news!);

        if (newsData.news!.length < 100) {
          await NewsHelper.addAll(_newsList);
          _newsList.clear();
          _page = 1;
          break;
        }
      } else {
        _newsList.clear();
        await NewsHelper.addAll(_oldNews);
        _page = 1;
        break;
      }
    }
  }

  FutureOr<void> _getNewsById(
    NewsGetByIdEvent event,
    Emitter<NewsState> emit,
  ) async {
    HttpResult result = await ApiService.getNewsById(event.id);
    if (result.isSuccess) {
      NewsModel news = NewsModel.fromJson(result.result);
      await NewsHelper.add(news);
    }
  }

  FutureOr<void> _getBanners(BannerLoadedEvent event, Emitter emit) async {
    HttpResult result = await ApiService.getBanners();

    if (result.isSuccess) {
      NewsData newsData = NewsData.fromJson(result.result);
      await NewsHelper.addBanners(newsData.news!);
    }
  }

  FutureOr<void> _selectNews(
    NewsSelectedEvent event,
    Emitter emit,
  ) {
    _news = event.news;
  }

  NewsModel get news => _news;
}
