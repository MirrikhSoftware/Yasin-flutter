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

import 'package:equatable/equatable.dart';
import 'package:yaaseen/core/constants/enums.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/services/app_audio_service.dart';
import 'package:yaaseen/utils/logger.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AppAudioService audioService;
  AudioBloc({required this.audioService}) : super(AudioState.initial()) {
    on<_Started>(_onStart);
    on<_Played>(_onPlayed);
    on<_Paused>(_onPause);
    on<_Stopped>(_onStop);
    on<_ToNext>(_toNext);
    on<_ToPrevious>(_toPrevious);
    on<_IndexChanged>(_changeIndex);

    audioService.player.currentIndexStream.listen((event) {
      if (state.status != PlayerStatus.playing) {
        return;
      }
      Log.d('Indexes: $event/${state.currentPlaying}', name: 'audio_bloc');
      add(AudioEvent.indexChanged(event ?? 0));
    });
  }

  FutureOr<void> _onStart(_Started event, Emitter emit) async {
    await audioService.init();

    final index = AppPref.lastPlaying;
    if (index > 0) {
      await audioService.seekToIndex(index);
      emit(state.copyWith(
        isInitial: true,
        currentPlaying: index,
        status: PlayerStatus.pause,
      ));
    }
  }

  FutureOr<void> _onPlayed(_Played event, Emitter emit) async {
    if (!state.isInitial) {
      await audioService.seekToIndex(event.index ?? state.currentPlaying);
    }
    audioService.play();
    emit(state.copyWith(
      currentPlaying: event.index,
      status: PlayerStatus.playing,
      isInitial: false,
    ));
  }

  FutureOr<void> _onPause(_Paused event, Emitter emit) async {
    audioService.pause();
    emit(state.copyWith(status: PlayerStatus.pause));
  }

  FutureOr<void> _onStop(_Stopped event, Emitter emit) async {
    await audioService.stop();
    emit(AudioState.initial());
  }

  FutureOr<void> _toNext(_ToNext event, Emitter emit) async {
    final nextIndex = (state.currentPlaying + 1) % 84;
    add(AudioEvent.played(index: nextIndex));
  }

  FutureOr<void> _toPrevious(_ToPrevious event, Emitter emit) async {
    final previousIndex = state.currentPlaying - 1;

    if (!previousIndex.isNegative) {
      add(AudioEvent.played(index: state.currentPlaying - 1));
    }
  }

  void _changeIndex(_IndexChanged event, Emitter<AudioState> emit) {
    emit(state.copyWith(currentPlaying: event.index));
  }
}
