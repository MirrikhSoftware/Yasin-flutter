part of 'player_bloc.dart';

@immutable
abstract class PlayingState {}

class PlayerInitial extends PlayingState {}

class PlayerPlayingState extends PlayingState {
  final int id;
  PlayerPlayingState(this.id);
}
