part of 'size_bloc.dart';

@immutable
abstract class SizeEvent {}

class ArabicTextSizeChanged extends SizeEvent {
  final double size;
  ArabicTextSizeChanged(this.size);
}

class MeaningTextSizeChanged extends SizeEvent {
  final double size;
  MeaningTextSizeChanged(this.size);
}

class TranscriptionTextSizeChanged extends SizeEvent {
  final double size;
  TranscriptionTextSizeChanged(this.size);
}
