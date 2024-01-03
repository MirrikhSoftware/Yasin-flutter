part of 'audio_bloc.dart';

sealed class AudioEvent {
  const AudioEvent();
  const factory AudioEvent.started() = _Started;
  const factory AudioEvent.played({int? index}) = _Played;
  const factory AudioEvent.indexChanged(int index) = _IndexChanged;
  const factory AudioEvent.paused() = _Paused;
  const factory AudioEvent.stopped() = _Stopped;
  const factory AudioEvent.toNext() = _ToNext;
  const factory AudioEvent.toPrevious() = _ToPrevious;
}

final class _IndexChanged extends AudioEvent {
  final int index;
  const _IndexChanged(this.index);
}

final class _Started extends AudioEvent {
  const _Started();
}

final class _ToNext extends AudioEvent {
  const _ToNext();
}

final class _Stopped extends AudioEvent {
  const _Stopped();
}

final class _ToPrevious extends AudioEvent {
  const _ToPrevious();
}

final class _Paused extends AudioEvent {
  const _Paused();
}

final class _Played extends AudioEvent {
  final int? index;
  const _Played({this.index});
}
