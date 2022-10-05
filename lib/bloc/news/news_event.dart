part of 'news_bloc.dart';

abstract class NewsEvent {}

class NewsLoadedEvent extends NewsEvent {}

class NewsGetByIdEvent extends NewsEvent {
  final String id;
  NewsGetByIdEvent(this.id);
}

class NewsSelectedEvent extends NewsEvent {
  final NewsModel news;
  NewsSelectedEvent(this.news);
}

class BannerLoadedEvent extends NewsEvent {}

