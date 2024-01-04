part of 'network_bloc.dart';

@immutable
abstract class NetworkState {
  const NetworkState();
}

final class NetworkInitial extends NetworkState {
  const NetworkInitial();
}

final class NetworkSuccess extends NetworkState {
  const NetworkSuccess();
}

final class NetworkFailure extends NetworkState {
  const NetworkFailure();
}
