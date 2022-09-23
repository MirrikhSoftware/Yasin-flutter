import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayingState> {
  final AudioPlayer _player = AudioPlayer();
  AudioPlayer? get player => _player;
  int _playingId = AppPrefs.lastPlaying;
  int get playingId => _playingId;
  late List<GlobalKey> _keys;
  List<GlobalKey> get keys => _keys;

  PlayerBloc() : super(PlayerInitial()) {
    _keys = List.generate(83, (i) => GlobalKey());
    on<PlayAudioEvent>(_playAudio);
    on<PauseAudioEvent>(_onComplete);
    on<PlayerStopEvent>(_stopAudio);
    on<PlayerGlobalKeysEvent>(_setKeys);
  }

  FutureOr<void> _playAudio(
    PlayAudioEvent event,
    Emitter emit,
  ) async {
    _playingId = event.id;
    await AppPrefs.setLastPlaying(_playingId);
    String id = '${event.id}'.padLeft(2, '0');
    String path = 'assets/audio/yasin$id.mp3';
    final byteData = await rootBundle.load(path);
    final bytes = byteData.buffer.asUint8List();
    await _player.play(BytesSource(bytes));
    BuildContext context = _keys[_playingId - 1].currentContext!;
    const Duration duration = Duration(milliseconds: 500);
    Scrollable.ensureVisible(
      context,
      duration: duration,
      alignment: .1
    );
    emit(PlayerPlayingState(event.id));
  }

  FutureOr<void> _stopAudio(
    PlayerStopEvent event,
    Emitter emit,
  ) async {
    _playingId = 0;
    await AppPrefs.setLastPlaying(0);
    await _player.stop();
    emit(PlayerInitial());
  }

  FutureOr<void> _onComplete(
    PauseAudioEvent event,
    Emitter emit,
  ) async {
    await _player.pause();
    emit(PlayerInitial());
  }

  FutureOr<void> _setKeys(
    PlayerGlobalKeysEvent event,
    Emitter emit,
  ) async {
    _keys = event.keys;
  }
}
