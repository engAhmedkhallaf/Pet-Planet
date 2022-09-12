part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoadingState extends InternetState {}

class InternetConnectedState extends InternetState {
  final String message;
  const InternetConnectedState({
    required this.message,
  });
}

class InternetDisConnectedState extends InternetState {
  final String message;
  const InternetDisConnectedState({
    required this.message,
  });
}
