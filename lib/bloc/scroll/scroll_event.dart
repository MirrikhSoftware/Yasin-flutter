part of 'scroll_bloc.dart';

@immutable
abstract class ScrollEvent {}

class ScrollAddKeysEvent extends ScrollEvent {
  final List<GlobalKey> keys;
  ScrollAddKeysEvent(this.keys);
}
