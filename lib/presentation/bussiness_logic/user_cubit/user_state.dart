part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {}

class GetUserDataLoadingState extends UserState {}

class GetUserDataSuccessState extends UserState {}

class GetUserDataFailureState extends UserState {
  final String errorMessage;
  const GetUserDataFailureState(this.errorMessage);
}
