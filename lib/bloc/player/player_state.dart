part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

class PlayerPlayingState extends PlayerState {
  final int id;
  PlayerPlayingState(this.id);
}
