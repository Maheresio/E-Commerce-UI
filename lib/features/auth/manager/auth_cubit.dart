import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/error/firebase_exceptions.dart';
import '../../../core/utils/enums.dart';
import '../model/user_model.dart';
import '../repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepo,
    this.email = '',
    this.password = '',
    this.authFormType = AuthFormType.login,
    this.name = '',
  }) : super(AuthInitial());

  //fields
  final AuthRepo authRepo;
  String email;
  String password;
  String name;
  AuthFormType authFormType;

  void copyWith({
    String? email,
    String? password,
    String? name,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.name = name ?? this.name;
    this.authFormType = authFormType ?? this.authFormType;
  }

  void updateName(String name) => copyWith(name: name);
  void updateEmail(String email) => copyWith(email: email);
  void updatePassword(String password) => copyWith(password: password);
  void updateAuthFormType(AuthFormType authFormType) =>
      copyWith(authFormType: authFormType);

  void toggle() => authFormType == AuthFormType.login
      ? updateAuthFormType(AuthFormType.register)
      : updateAuthFormType(AuthFormType.login);

  //firebase methods

  Future<void> submit() async {
    emit(AuthLoading());
    try {
      if (authFormType == AuthFormType.login) {
        await authRepo.loginWithEmailAndPassword(email, password);
      } else {
        await authRepo.signUpWithEmailAndPassword(email, password, name);
        await setUserData();
      }
      emit(AuthSuccess());
    } on FirebaseAuthException catch (error) {
      String errorMsg = getExceptionMsg(error);
      emit(AuthFailure(errorMsg));
    } catch (error) {
      emit(AuthFailure(error.toString()));
    }
  }

  Future<void> setUserData() async {
    try {
      final userId = getCurrentUser()!.uid;
      await authRepo.setUserData(UserModel(
        email: email,
        name: name,
        uid: userId,
      ));
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  User? getCurrentUser() {
    return authRepo.getCurrentUser;
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authRepo.logout();
      emit(AuthSuccess());
    } on FirebaseAuthException catch (error) {
      emit(AuthFailure(error.message!));
    }
  }
}
