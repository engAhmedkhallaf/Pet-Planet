import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/core/network/error/firebase_auth_exception.dart';
import 'package:pet_planet/data/collections_manager.dart';
import 'package:pet_planet/data/models/user_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitialState());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> signUp({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    emit(SignupLoadingState());
    try {
      // Create New Account
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        // Save UserData to Firestore
        createUser(userModel, value.user!.uid);
        emit(SignupSuccessState(uid: value.user!.uid));
      });
    } on FirebaseAuthException catch (e) {
      String error = firebaseAuthExceptionHandler(e);
      emit(SignupFailureState(errorMessage: error));
    } catch (e) {
      emit(SignupFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> createUser(UserModel userModel, String uid) async {
    await _firebaseFirestore
        .collection(CollectionManager.usersCollection)
        .doc(uid)
        .set(userModel.toDocument());
    await _firebaseFirestore
        .collection(CollectionManager.usersCollection)
        .doc(uid)
        .update({'id': uid});
  }
}
