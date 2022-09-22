import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayingState> {
  final AudioPlayer _player = AudioPlayer();
  AudioPlayer? get player => _player;
  int _playingId = 0;
  int get playingId => _playingId;

  PlayerBloc() : super(PlayerInitial()) {
    on<PlayAudioEvent>(_playAudio);
    on<PauseAudioEvent>(_onComplete);
    on<AutoPlayEvent>(_autoPlay);
  }

  FutureOr<void> _playAudio(
    PlayAudioEvent event,
    Emitter emit,
  ) async {
    _playingId = event.id;
    String id = '${event.id}'.padLeft(2, '0');
    String path = 'assets/audio/yasin$id.mp3';
    final byteData = await rootBundle.load(path);
    final bytes = byteData.buffer.asUint8List();

    // await _player.stop();
    // await _player.release();

    await _player.play(BytesSource(bytes));
    emit(PlayerPlayingState(event.id));
  }

  FutureOr<void> _autoPlay(
    AutoPlayEvent event,
    Emitter emit,
  ) async {
    while (_playingId < 83) {
      _playingId = event.id;
      String id = '$_playingId'.padLeft(2, '0');
      String path = 'assets/audio/yasin$id.mp3';
      final byteData = await rootBundle.load(path);
      final bytes = byteData.buffer.asUint8List();
      await _player.play(BytesSource(bytes));
      _playingId++;
      emit(PlayerPlayingState(event.id));
    }
  }

  FutureOr<void> _onComplete(
    PauseAudioEvent event,
    Emitter emit,
  ) async {
    await _player.pause();
    emit(PlayerInitial());
  }
}
