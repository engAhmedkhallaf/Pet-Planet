import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _connectivityStreamSubscription;

  InternetCubit() : super(InternetLoadingState());

  void connected() {
    emit(const InternetConnectedState(message: 'Your internet connection was restored'));
  }

  void notConnected() {
    emit(const InternetDisConnectedState(message: 'You are currently offline'));
  }

  void checkConnection() {
    {
      _connectivityStreamSubscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          connected();
        } else if (result == ConnectivityResult.none) {
          notConnected();
        }
      });
    }
  }

  @override
  Future<void> close() {
    _connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
