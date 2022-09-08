part of 'auth_cubit.dart';

abstract class AuthState extends Equatable{
   const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailureState extends AuthState {
  final String errorMessage;
  const AuthFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

  
}

// onboarding
class DotsChangeState extends AuthState {
  final int index;
  const DotsChangeState({required this.index});

   @override
  List<Object> get props => [index];
}
