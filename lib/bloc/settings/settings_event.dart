part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {
  const SettingsEvent();
  const factory SettingsEvent.started() = _Started;
  const factory SettingsEvent.arabicSizeChanged(double size) =
      _ArabicTextSizeChanged;
  const factory SettingsEvent.meaningSizeChanged(double size) =
      _MeaningTextSizeChanged;
  const factory SettingsEvent.transcriptionSizeChanged(double size) =
      _TranscriptionTextSizeChanged;

  const factory SettingsEvent.showTexts({
    bool? showArabic,
    bool? showMeaning,
    bool? showTranscription,
  }) = _ShowTexts;
}

final class _Started extends SettingsEvent {
  const _Started();
}

final class _ShowTexts extends SettingsEvent {
  final bool? showArabic;
  final bool? showMeaning;
  final bool? showTranscription;
  const _ShowTexts({
    this.showArabic,
    this.showMeaning,
    this.showTranscription,
  });
}

final class _ArabicTextSizeChanged extends SettingsEvent {
  final double size;
  const _ArabicTextSizeChanged(this.size);
}

final class _MeaningTextSizeChanged extends SettingsEvent {
  final double size;
  const _MeaningTextSizeChanged(this.size);
}

final class _TranscriptionTextSizeChanged extends SettingsEvent {
  final double size;
  const _TranscriptionTextSizeChanged(this.size);
}
