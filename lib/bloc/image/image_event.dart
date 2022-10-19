part of 'image_bloc.dart';

abstract class ImageEvent {}

class ImageLoadedEvent extends ImageEvent {
  final String url;
  ImageLoadedEvent(this.url);
}