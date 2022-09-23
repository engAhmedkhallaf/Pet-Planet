part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}
class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final UserModel user;

  const UserSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}

class UserFailureState extends UserState {}
