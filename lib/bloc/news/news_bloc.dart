import 'dart:async';

import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/models/models.dart';
import 'package:yaaseen/screens/test/firestore_service.dart';
import 'package:yaaseen/services/services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  late NewsModel _news;

  NewsBloc() : super(NewsInitial()) {
    // _oldNews = NewsHelper.newsList;
    on<NewsLoadedEvent>(_getNews);
    on<NewsGetByIdEvent>(_getNewsById);
    on<NewsSelectedEvent>(_selectNews);
  }

  FutureOr<void> _getNews(
    NewsLoadedEvent event,
    Emitter<NewsState> emit,
  ) async {
    
  }

  FutureOr<void> _getNewsById(
    NewsGetByIdEvent event,
    Emitter<NewsState> emit,
  ) async {

  }

  FutureOr<void> _selectNews(
    NewsSelectedEvent event,
    Emitter emit,
  ) {
    _news = event.news;
  }

  NewsModel get news => _news;
}
