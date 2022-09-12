import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/core/network/error/firebase_auth_exception.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitialState());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> resetPassword({
    required String email,
  }) async {
    emit(ForgotPasswordLoadingState());
    try {
      // Sign In
      await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
        emit(const ForgotPasswordSuccessState(message: 'Email verification has been send, check your mail'));
      });
    } on FirebaseAuthException catch (e) {
      String error = firebaseAuthExceptionHandler(e);
      emit(ForgotPasswordFailureState(errorMessage: error));
    } catch (e) {
      emit(ForgotPasswordFailureState(errorMessage: e.toString()));
    }
  }
}
