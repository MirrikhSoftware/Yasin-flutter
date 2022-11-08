import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaaseen/services/services.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<ImageLoadedEvent>(_downloadImage);
  }

  FutureOr<void> _downloadImage(
    ImageLoadedEvent event,
    Emitter emit,
  ) async {
    emit(ImageLoadingState());
    try {
      String path = await ApiService.downloadFiles(event.url);
      emit(ImageSuccessState(path));
    } catch (err) {
      emit(ImageFailedState(err.toString()));
    }
  }
}
