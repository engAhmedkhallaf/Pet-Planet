import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/data/models/user_model.dart';
import 'package:pet_planet/data/repositories/auth/auth_repository.dart';
import 'package:pet_planet/data/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _authUserSubscription;
  ProfileBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        super(ProfileLoadingState()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);

    _authUserSubscription = _authRepository.user.listen((authUser) {
      if (authUser != null) {
        _userRepository.getUser(authUser.uid).listen((user) {
          add(LoadProfileEvent(uid: authUser.uid));
          add(UpdateProfileEvent(user: user));
        });
      }
    });
  }

  FutureOr<void> _onLoadProfile(
      LoadProfileEvent event, Emitter<ProfileState> emit) async {
    if (event.uid != null) {
      emit(ProfileLoadingState());
      _userRepository.getUser(event.uid!).listen((user) async {
        add(
          UpdateProfileEvent(user: user),
        );
      });
    } else {
      emit(ProfileUnAuthenticatedState());
    }
  }

  FutureOr<void> _onUpdateProfile(
      UpdateProfileEvent event, Emitter<ProfileState> emit) {
        _userRepository.updateUser(event.user);
    emit(ProfileLoadedState(user: event.user));
  }

  Future<void> logout() async {
    await _authRepository.signOut();
  }

  @override
  Future<void> close() async {
    _authUserSubscription?.cancel();
    super.close();
  }
}
