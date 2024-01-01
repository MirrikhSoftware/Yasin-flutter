// part of 'player_bloc.dart';

// @immutable
// sealed class PlayingState extends Equatable {
//   final int id;
//   final int totalDuration;
//   final int currentDuration;
//   final PlayerStatus status;

//   const PlayingState({
//     required this.currentDuration,
//     required this.id,
//     required this.totalDuration,
//     required this.status,
//   });

//   PlayingState copyWith({
//     int? id,
//     int? totalDuration,
//     int? currentDuration,
//     PlayerStatus? status,
//   });

//   const factory PlayingState.initial() = _PlayingState;

//   @override
//   List<Object?> get props => [id, totalDuration, currentDuration, status];
// }

// class _PlayingState extends PlayingState {
//   const _PlayingState({
//     super.currentDuration = 0,
//     super.id = 0,
//     super.totalDuration = 0,
//     super.status = PlayerStatus.initial,
//   });

//   @override
//   PlayingState copyWith({
//     int? id,
//     int? totalDuration,
//     int? currentDuration,
//     PlayerStatus? status,
//   }) =>
//       _PlayingState(
//         currentDuration: currentDuration ?? this.currentDuration,
//         id: id ?? this.id,
//         status: status ?? this.status,
//         totalDuration: totalDuration ?? this.totalDuration,
//       );
// }
