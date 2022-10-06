part of 'news_image_bloc.dart';

class NewsImageEvent {}

class NewsImageIndexChangedEvent extends NewsImageEvent {
  final int index;
  NewsImageIndexChangedEvent(this.index);
}
