import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  static InternetCubit get(context) => BlocProvider.of(context);

  StreamSubscription? _connectivityStreamSubscription;

  InternetCubit() : super(InternetLoadingState());

  void connected() {
    emit(
      const InternetConnectedState(
        message: AppStrings.yourInternetConnectionWasRestored,
      ),
    );
  }

  void notConnected() {
    emit(
      const InternetDisConnectedState(
        message: AppStrings.youAreCurrentlyOffline,
      ),
    );
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
