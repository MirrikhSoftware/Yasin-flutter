/*

  Created by: Bakhromjon Polat
  Created on: Jan 01 2024 10:50:50
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/
enum PlayerStatus {
  initial('initial'),
  playing('playing'),
  paused('paused'),
  stop('stop');

  const PlayerStatus(this.value);
  final String value;
}

enum PlayingType {
  initial(0),
  simple(1),
  withMeaning(2),
  onlyMeaning(3);

  const PlayingType(this.value);
  final int value;
}

extension PlayerStatusX on PlayerStatus {
  bool get isInitial => this == PlayerStatus.initial;
  bool get isPlaying => this == PlayerStatus.playing;
  bool get isPaused => this == PlayerStatus.paused;
  bool get isStop => this == PlayerStatus.stop;
}

extension PlayingTypeX on PlayingType {
  bool get isInitial => this == PlayingType.initial;
  bool get isSimple => this == PlayingType.simple;
  bool get isWithMeaning => this == PlayingType.withMeaning;
  bool get isOnlyMeaning => this == PlayingType.onlyMeaning;
}
