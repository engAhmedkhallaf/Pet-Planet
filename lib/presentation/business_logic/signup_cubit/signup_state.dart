part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {
  final String uid;
  const SignupSuccessState({required this.uid});
}

class SignupFailureState extends SignupState {
  final String errorMessage;
  const SignupFailureState({required this.errorMessage});
}
