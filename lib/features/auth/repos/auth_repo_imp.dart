import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/firebase_api_paths.dart';
import '../../../core/utils/firebase_service.dart';
import '../../../core/utils/service_locator.dart';
import '../model/user_model.dart';
import 'auth_repo.dart';

final _fireServices = getIt.get<FirebaseServices>();

class AuthRepoImp implements AuthRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get getCurrentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
    user.user!.updateDisplayName(name);
    return user.user;
  }

  @override
  Future<void> logout() async => await _firebaseAuth.signOut();

  @override
  Future<void> setUserData(UserModel user) async {
    await _fireServices.setData(
      documentPath: FirebaseApiPaths.users(user.uid),
      data: user.toMap(),
    );
  }

  @override
  Future<void> saveUserIdLocally() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', getCurrentUser!.uid);
  }

  @override
  Future<void> deleteUserIdLocally() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uid');
  }
}
