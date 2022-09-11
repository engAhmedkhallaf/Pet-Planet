part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserDataLoadingState extends UserState {}

class UserDataSuccessState extends UserState {
  
}

class UserDataFailureState extends UserState {}


