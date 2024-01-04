import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  StreamSubscription? _subscription;
  final Connectivity connectivity;

  NetworkBloc(this.connectivity) : super(const NetworkInitial()) {
    on<_StateChanged>((event, emit) {
      emit(event.state);
    });
    on<_Listened>(
      (event, emit) {
        _subscription = connectivity.onConnectivityChanged.listen((status) {
          switch (status) {
            case ConnectivityResult.bluetooth:
            case ConnectivityResult.none:
            case ConnectivityResult.other:
              add(const NetworkEvent.stateChanged(NetworkFailure()));
              break;
            case ConnectivityResult.ethernet:
            case ConnectivityResult.mobile:
            case ConnectivityResult.wifi:
            case ConnectivityResult.vpn:
              add(const NetworkEvent.stateChanged(NetworkSuccess()));
              break;
          }
        });
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
