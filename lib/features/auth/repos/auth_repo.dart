import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

abstract class AuthRepo {
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String name);
  User? get getCurrentUser;
  Future<void> setUserData(UserModel user);
  Future<void> saveUserIdLocally();
  Future<void> deleteUserIdLocally();
  

  Stream<User?> authStateChanges();
  Future<void> logout();
}
