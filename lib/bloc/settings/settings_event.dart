part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {
  const SettingsEvent();
  const factory SettingsEvent.started() = _Started;
}

final class _Started extends SettingsEvent {
  const _Started();
}

final class ArabicTextSizeChanged extends SettingsEvent {
  final double size;
  const ArabicTextSizeChanged(this.size);
}

final class MeaningTextSizeChanged extends SettingsEvent {
  final double size;
  const MeaningTextSizeChanged(this.size);
}

final class TranscriptionTextSizeChanged extends SettingsEvent {
  final double size;
  const TranscriptionTextSizeChanged(this.size);
}
