import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayingState> {
  final AudioPlayer _player = AudioPlayer();
  AudioPlayer get player => _player;
  int _playingId = AppPrefs.lastPlaying;
  int get playingId => _playingId;
  late List<GlobalKey> _keys;
  List<GlobalKey> get keys => _keys;
  num _duration = 000000.1;
  num get duration => _duration;

  PlayerBloc() : super(PlayerInitial()) {
    _keys = List.generate(83, (i) => GlobalKey());
    on<PlayAudioEvent>(_playAudio);
    on<PauseAudioEvent>(_onComplete);
    on<PlayerStopEvent>(_stopAudio);
    on<PlayerGlobalKeysEvent>(_setKeys);
    on<PlayerNextEvent>(_playNext);
    on<PlayerPrevEvent>(_playPrev);
  }

  FutureOr<void> _playAudio(
    PlayAudioEvent event,
    Emitter emit,
  ) async {
    await _play(event.id);
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

  FutureOr<void> _playNext(
    PlayerNextEvent event,
    Emitter emit,
  ) async {
    int id = (_playingId + 1) > 83 ? 1 : _playingId + 1;

    await _play(id);
    emit(PlayerPlayingState(id));
  }

  FutureOr<void> _playPrev(
    PlayerPrevEvent event,
    Emitter emit,
  ) async {
    int id = (_playingId - 1) < 1 ? 1 : _playingId - 1;

    await _play(id);
    emit(PlayerPlayingState(id));
  }

  FutureOr<void> _setKeys(
    PlayerGlobalKeysEvent event,
    Emitter emit,
  ) async {
    _keys = event.keys;
  }

  Future _play(int id) async {
    _playingId = id;
    await AppPrefs.setLastPlaying(_playingId);
    String no = '$id'.padLeft(2, '0');
    String path = 'assets/audio/yasin$no.mp3';
    final byteData = await rootBundle.load(path);
    final bytes = byteData.buffer.asUint8List();
    await _player.play(BytesSource(bytes));

    final dur = await _player.getDuration();
    _duration = dur!.inMilliseconds;

    try {
      BuildContext context = _keys[_playingId - 1].currentContext!;
      const Duration duration = Duration(milliseconds: 500);
      // ignore: use_build_context_synchronously
      Scrollable.ensureVisible(context, duration: duration, alignment: .1);
    } catch (err) {
      // LogHelper.addLog(
      //   err.toString(),
      //   file: 'player_bloc.dart',
      //   function: '_play(int id)',
      // );
    }
  }
}
