part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class PlayAudioEvent extends PlayerEvent {
  final int id;
  PlayAudioEvent(this.id);
}

class PauseAudioEvent extends PlayerEvent {
  // final int id;
  // PauseAudioEvent(this.id);
}

class AutoPlayEvent extends PlayerEvent {
  final int id;
  AutoPlayEvent(this.id);
}
