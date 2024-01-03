// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'audio_bloc.dart';

class AudioState extends Equatable {
  final PlayerStatus status;
  final int currentPlaying;
  final bool isInitial;

  const AudioState({
    required this.status,
    required this.currentPlaying,
    required this.isInitial,
  });
  factory AudioState.initial() => const AudioState(
        currentPlaying: 0,
        status: PlayerStatus.stop,
        isInitial: false,
      );

  AudioState copyWith({
    PlayerStatus? status,
    int? currentPlaying,
    bool? isInitial,
  }) {
    return AudioState(
      isInitial: isInitial ?? this.isInitial,
      status: status ?? this.status,
      currentPlaying: currentPlaying ?? this.currentPlaying,
    );
  }

  @override
  List<Object?> get props => [status, currentPlaying, isInitial];
}
