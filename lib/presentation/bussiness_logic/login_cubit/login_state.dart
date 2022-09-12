part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}


class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String uid;
  const LoginSuccessState({required this.uid});
}

class LoginFailureState extends LoginState {
  final String errorMessage;
  const LoginFailureState({required this.errorMessage});
}
