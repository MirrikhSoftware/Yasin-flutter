import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class MediaPlayer {
  static final AudioPlayer _player = AudioPlayer();
  static bool _isPlaying = false;

  static play(String path) async {
    var byteData = await rootBundle.load(path);

    Uint8List bytes = byteData.buffer.asUint8List();
    print('=================$_isPlaying===============');
    if (_isPlaying) {
      await _player.stop();
    } else {
      await _player.play(BytesSource(bytes));
    }
  }

  static Stream<PlayerState> onPlayerStateChanged() async* {

    yield* _player.onPlayerStateChanged..listen((event) {
      _isPlaying = event == PlayerState.playing;
      print('================= $event =============');
    });
  }

  static StreamSubscription<void> onComplete() =>
      _player.onPlayerComplete.listen((event) {
        _isPlaying = false;
      });

  static final StreamController<PlayerState> _playerStateController =
      StreamController<PlayerState>.broadcast();
}
