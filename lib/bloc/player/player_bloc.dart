// import 'dart:async';

// // import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yaaseen/core/core.dart';
// import 'package:yaaseen/core/enums/playing_state.dart';
// import 'package:yaaseen/hive_helper/hive_helper.dart';

// part 'player_event.dart';
// part 'player_state.dart';

// class PlayerBloc extends Bloc<PlayerEvent, PlayingState> {
//   final AudioPlayer _player;

//   PlayerBloc(AudioPlayer player)
//       : _player = player,
//         super(const PlayingState.initial()) {
//     on<_Play>(_playAudio);
//     on<_Pause>(_onComplete);
//     on<_Stop>(_stopAudio);
//     on<_Next>(_playNext);
//     on<_Prev>(_playPrev);
//   }

//   FutureOr<void> _playAudio(
//     _Play event,
//     Emitter emit,
//   ) async {
//     await _play(event.id);
//     emit(state.copyWith(id: event.id));
//   }

//   FutureOr<void> _stopAudio(
//     _Stop event,
//     Emitter emit,
//   ) async {
//     await AppPref.setLastPlaying(0);
//     await _player.stop();
//     emit(const PlayingState.initial());
//   }

//   FutureOr<void> _onComplete(
//     _Pause event,
//     Emitter emit,
//   ) async {
//     await _player.pause();
//     emit(const PlayingState.initial());
//   }

//   FutureOr<void> _playNext(
//     _Next event,
//     Emitter emit,
//   ) async {
//     int id = (state.id + 1) > 83 ? 1 : state.id + 1;

//     await _play(id);
//     emit(state.copyWith(id: id));
//   }

//   FutureOr<void> _playPrev(
//     _Prev event,
//     Emitter emit,
//   ) async {
//     int id = (state.id - 1) < 1 ? 1 : state.id - 1;

//     await _play(id);
//     emit(state.copyWith(id: id));
//   }

//   Future _play(int id) async {
//     await AppPref.setLastPlaying(id);
//     String path = 'assets/audio/$id.mp3';
//     final byteData = await rootBundle.load(path);
//     final bytes = byteData.buffer.asUint8List();
//     await _player.play(BytesSource(bytes));

//     final dur = await _player.getDuration();

//     try {} catch (err) {
//       // LogHelper.addLog(
//       //   err.toString(),
//       //   file: 'player_bloc.dart',
//       //   function: '_play(int id)',
//       // );
//     }
//   }
// }
