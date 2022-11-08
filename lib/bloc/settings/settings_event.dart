part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class ArabicTextSizeChanged extends SettingsEvent {
  final double size;
  ArabicTextSizeChanged(this.size);
}

class MeaningTextSizeChanged extends SettingsEvent {
  final double size;
  MeaningTextSizeChanged(this.size);
}

class TranscriptionTextSizeChanged extends SettingsEvent {
  final double size;
  TranscriptionTextSizeChanged(this.size);
}

