import 'package:pet_planet/data/models/user_model.dart';

abstract class BaseUserRepository {
  Stream<UserModel> getUser(String userId);
  Future<void> updateUser(UserModel user);
}
