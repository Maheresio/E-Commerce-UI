import 'package:firebase_auth/firebase_auth.dart';

import 'auth_repo.dart';

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
      String email, String password) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
    return user.user;
  }

  @override
  Future<void> logout() async => await _firebaseAuth.signOut();
}
