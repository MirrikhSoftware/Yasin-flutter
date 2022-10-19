part of 'image_bloc.dart';

abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageSuccessState extends ImageState {
  final String path;
  ImageSuccessState(this.path);
}

class ImageFailedState extends ImageState {
  final String error;
  ImageFailedState(this.error);
}

class ImageLoadingState extends ImageState {}
