part of 'network_bloc.dart';

abstract class NetworkEvent {
  const NetworkEvent();

  const factory NetworkEvent.listened() = _Listened;
  const factory NetworkEvent.stateChanged(NetworkState state) = _StateChanged;
}

class _Listened extends NetworkEvent {
  const _Listened();
}

class _StateChanged extends NetworkEvent {
  final NetworkState state;
  const _StateChanged(this.state);
}
