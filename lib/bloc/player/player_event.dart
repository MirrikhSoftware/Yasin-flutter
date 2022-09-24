part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class PlayAudioEvent extends PlayerEvent {
  final int id;
  PlayAudioEvent(this.id);
}

class PauseAudioEvent extends PlayerEvent {}

class PlayerStopEvent extends PlayerEvent {}

class PlayerNextEvent extends PlayerEvent {}

class PlayerPrevEvent extends PlayerEvent {}

class PlayerGlobalKeysEvent extends PlayerEvent {
  final List<GlobalKey> keys;
  PlayerGlobalKeysEvent(this.keys);
}
