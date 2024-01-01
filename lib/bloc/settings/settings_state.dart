// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  final double arabicSize;
  final double meaningSize;
  final double transcriptionSize;
  const SettingsState({
    required this.arabicSize,
    required this.meaningSize,
    required this.transcriptionSize,
  });
  @override
  List<Object?> get props => [arabicSize, meaningSize, transcriptionSize];

  SettingsState copyWith({
    double? arabicSize,
    double? meaningSize,
    double? transcriptionSize,
  });

  const factory SettingsState.initial() = _SettingsState;
}

class _SettingsState extends SettingsState {
  const _SettingsState({
    super.arabicSize = 0,
    super.meaningSize = 0,
    super.transcriptionSize = 0,
  });

  @override
  SettingsState copyWith({
    double? arabicSize,
    double? meaningSize,
    double? transcriptionSize,
  }) =>
      _SettingsState(
        arabicSize: arabicSize ?? this.arabicSize,
        meaningSize: meaningSize ?? this.meaningSize,
        transcriptionSize: transcriptionSize ?? this.transcriptionSize,
      );
}
