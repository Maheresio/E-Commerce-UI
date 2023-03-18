import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/features/auth/repos/auth_repo.dart';
import 'package:flutter/material.dart';

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

  //methods

  Future<void> submit() async {
    emit(AuthLoading());
    try {
      if (authFormType == AuthFormType.login) {
        await authRepo.loginWithEmailAndPassword(email, password);
      } else {
        await authRepo.signUpWithEmailAndPassword(email, password);
      }
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure());
      rethrow;
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authRepo.logout();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure());
      debugPrint(e.toString());
    }
  }
}
