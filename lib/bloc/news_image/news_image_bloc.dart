import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_image_event.dart';
part 'news_image_state.dart';

class NewsImageBloc extends Bloc<NewsImageEvent, NewsImageState> {
  NewsImageBloc() : super(NewsImageState(0)) {
    on<NewsImageIndexChangedEvent>((event, emit) {
      emit(NewsImageState(event.index));
    });
  }
}
