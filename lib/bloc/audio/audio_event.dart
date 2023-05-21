part of 'audio_bloc.dart';

@freezed
class AudioEvent with _$AudioEvent {
  const factory AudioEvent.started() = _Started;
  const factory AudioEvent.played({int? index}) = _Played;
  const factory AudioEvent.paused() = _Paused;
  const factory AudioEvent.stopped() = _Stopped;
  const factory AudioEvent.resumed() = _Resumed;
  const factory AudioEvent.toNext() = _ToNext;
  const factory AudioEvent.toPrevious() = _ToPrevious;
}
