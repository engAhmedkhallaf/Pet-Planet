import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_planet/data/collections_manager.dart';
import 'package:pet_planet/data/models/user_model.dart';
import 'package:pet_planet/data/repositories/user/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<UserModel> getUser(String userId) {
    debugPrint('Getting user data from Cloud Firestore');
    return _firebaseFirestore
        .collection(CollectionManager.usersCollection)
        .doc(userId)
        .snapshots()
        .map((user) => UserModel.fromJson(user.data()!));
  }

  @override
  Future<void> updateUser(UserModel user) async {
    return _firebaseFirestore
        .collection(CollectionManager.usersCollection)
        .doc(user.id)
        .update(user.toDocument())
        .then(
          (value) => debugPrint('User Model updated.'),
        );
  }
}
