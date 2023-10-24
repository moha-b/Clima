import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'network_state.dart';

// import connectivity_plus

class NetworkCubit extends Cubit<NetworkState> {
  late final StreamSubscription connectivityStreamSubscription;
  final Connectivity connectivity = Connectivity();

  NetworkCubit() : super(ConnectedFailure()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((result) {
      print(result);
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        emit(ConnectedSuccess());
      } else {
        emit(ConnectedFailure());
      }
    });

    /// stars from here
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
