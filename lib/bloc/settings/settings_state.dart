// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  final double arabicSize;
  final double meaningSize;
  final double transcriptionSize;
  final bool showArabic;
  final bool showMeaning;
  final bool showTranscription;

  const SettingsState({
    required this.showArabic,
    required this.showMeaning,
    required this.showTranscription,
    required this.arabicSize,
    required this.meaningSize,
    required this.transcriptionSize,
  });
  @override
  List<Object?> get props => [
        arabicSize,
        meaningSize,
        transcriptionSize,
        showArabic,
        showMeaning,
        showTranscription,
      ];

  SettingsState copyWith({
    double? arabicSize,
    double? meaningSize,
    double? transcriptionSize,
    bool? showArabic,
    bool? showMeaning,
    bool? showTranscription,
  });

  const factory SettingsState.initial() = _SettingsState;
}

class _SettingsState extends SettingsState {
  const _SettingsState({
    super.arabicSize = 0,
    super.meaningSize = 0,
    super.transcriptionSize = 0,
    super.showArabic = true,
    super.showMeaning = true,
    super.showTranscription = true,
  });

  @override
  SettingsState copyWith({
    double? arabicSize,
    double? meaningSize,
    double? transcriptionSize,
    bool? showArabic,
    bool? showMeaning,
    bool? showTranscription,
  }) =>
      _SettingsState(
        arabicSize: arabicSize ?? this.arabicSize,
        meaningSize: meaningSize ?? this.meaningSize,
        transcriptionSize: transcriptionSize ?? this.transcriptionSize,
        showArabic: showArabic ?? this.showArabic,
        showMeaning: showMeaning ?? this.showMeaning,
        showTranscription: showTranscription ?? this.showTranscription,
      );
}
