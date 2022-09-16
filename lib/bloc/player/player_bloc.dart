import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  AudioPlayer? _player;
  PlayerBloc() : super(PlayerInitial()) {}

  FutureOr<void> _playAudio(
    PlayAudioEvent event,
    Emitter emit,
  ) async {
    String id = '${event.id}'.padLeft(2, '0');
    String path = 'assets/audio/yasin$id.mp3';
    var byteData = await rootBundle.load(path);

    if (_player != null) {
      await _player?.stop();
      await _player?.release();
    }

    _player = AudioPlayer();
    await _player?.play(AssetSource(path));
  }
}
