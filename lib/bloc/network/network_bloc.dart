import 'dart:async';

import 'package:yaaseen/core/core.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  StreamSubscription? _subscription;

  NetworkBloc() : super(NetworkInitial()) {
    on<ListenConnection>(_checkNetwork);
  }

  FutureOr<void> _checkNetwork(
    ListenConnection event,
    Emitter<NetworkState> state,
  ) {
    _subscription = Connectivity().onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.none) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(NetworkFailure());
      } else {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(NetworkSuccess());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
