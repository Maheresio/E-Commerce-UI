import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/error/firebase_exceptions.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/features/auth/repos/auth_repo.dart';

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

  void updateName(String email) => copyWith(email: email);
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
        await authRepo.signUpWithEmailAndPassword(email, password);
      }
      emit(AuthSuccess());
    } on FirebaseAuthException catch (error) {
      String errorMsg = getExceptionMsg(error);
      emit(AuthFailure(errorMsg));
    } catch (error) {
      emit(AuthFailure(error.toString()));
    }
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
