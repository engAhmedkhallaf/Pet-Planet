part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String message;
  const ForgotPasswordSuccessState({required this.message});
}

class ForgotPasswordFailureState extends ForgotPasswordState {
  final String errorMessage;
  const ForgotPasswordFailureState({required this.errorMessage});
}
