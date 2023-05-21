part of 'audio_bloc.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState({
    required PlayerStatus status,
    required int currentPlaying,
  }) = _AudioState;
  factory AudioState.initial() => const AudioState(
        currentPlaying: 0,
        status: PlayerStatus.stop,
      );
}
