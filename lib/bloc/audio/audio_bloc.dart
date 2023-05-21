/*

  Created by: Bakhromjon Polat
  Created on: May 21 2023 21:10:06
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaaseen/core/constants/enums.dart';
import 'package:yaaseen/services/app_audio_service.dart';

part 'audio_event.dart';
part 'audio_state.dart';
part 'audio_bloc.freezed.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AppAudioService audioService;
  AudioBloc({required this.audioService}) : super(AudioState.initial()) {
    on<_Started>(_onStart);
    on<_Played>(_onPlayed);
    on<_Paused>(_onPause);
    on<_Resumed>(_onResume);
    on<_Stopped>(_onStop);
    on<_ToNext>(_toNext);
    on<_ToPrevious>(_toPrevious);
  }

  FutureOr<void> _onStart(_Started event, Emitter emit) async =>
      await audioService.init();

  FutureOr<void> _onPlayed(_Played event, Emitter emit) async {
    await audioService.play();
    emit(state.copyWith(
      currentPlaying: event.index ?? 0,
      status: PlayerStatus.playing,
    ));
  }

  FutureOr<void> _onPause(_Paused event, Emitter emit) async {
    await audioService.pause();
    emit(state.copyWith(status: PlayerStatus.pause));
  }

  FutureOr<void> _onResume(_Resumed event, Emitter emit) async {
    await audioService.play();
    emit(state.copyWith(status: PlayerStatus.playing));
  }

  FutureOr<void> _onStop(_Stopped event, Emitter emit) async {
    await audioService.play();
    emit(state.copyWith(status: PlayerStatus.stop));
  }

  FutureOr<void> _toNext(_ToNext event, Emitter emit) async {
    await audioService.seekToNext();
    emit(state.copyWith(currentPlaying: state.currentPlaying + 1));
  }

  FutureOr<void> _toPrevious(_ToPrevious event, Emitter emit) async {
    await audioService.seekToPrevious();
    emit(state.copyWith(currentPlaying: state.currentPlaying - 1));
  }
}
