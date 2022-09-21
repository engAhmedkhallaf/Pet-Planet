import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/core/app/app_constants.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/data/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  UserCubit({
    FirebaseFirestore? firebaseFirestore,
    FirebaseAuth? firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        super(UserLoadingState());

  void getUserData() async {
    emit(UserLoadingState());
    try {
       _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .snapshots()
          .listen((user) {
        UserModel.fromSnapshot(user);
        emit(UserSuccessState(user: UserModel.fromSnapshot(user)));
      });
      //     .get()
      //     .then((value) {
      //
      // });
    } catch (e) {
      emit(UserFailureState());
    }
  }
}
