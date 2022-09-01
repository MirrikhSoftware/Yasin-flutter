import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class MediaPlayer {
  static AudioPlayer? _player;

  static play(String path) async {
    var byteData = await rootBundle.load(path);

    Uint8List bytes = byteData.buffer.asUint8List();
    if (_player != null) {
      _player?.stop();
      _player?.release();
    }

    _player = AudioPlayer(playerId: path);
    await _player?.play(BytesSource(bytes));

  }
  static dispose() {
    _player!.dispose();
  }
}
