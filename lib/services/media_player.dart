import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class MediaPlayer {
  static AudioPlayer? _player;

  static play(String path) async {
    var byteData = await rootBundle.load(path);

    Uint8List bytes = byteData.buffer.asUint8List();
    if (_player != null) {
      await _player?.stop();
      await _player?.release();
    }

    _player = AudioPlayer(playerId: path);
    await _player?.play(BytesSource(bytes));
  }
}
