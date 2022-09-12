import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/core/network/error/firebase_auth_exception.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      // Sign In
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        emit(LoginSuccessState(uid: value.user!.uid));
      });
    } on FirebaseAuthException catch (e) {
      String error = firebaseAuthExceptionHandler(e);
      emit(LoginFailureState(errorMessage: error));
    } catch (e) {
      emit(LoginFailureState(errorMessage: e.toString()));
    }
  }
}
