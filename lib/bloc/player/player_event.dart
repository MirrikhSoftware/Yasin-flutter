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

class PlayerStopEvent extends PlayerEvent {}

class PlayerGlobalKeysEvent extends PlayerEvent {
  final List<GlobalKey> keys;
  PlayerGlobalKeysEvent(this.keys);
}
