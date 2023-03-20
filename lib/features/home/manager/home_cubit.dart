import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/home/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  void getSaleProducts() {
    emit(HomeLoading());
    try {
      homeRepo.getSaleProducts();
      emit(HomeSuccess());
    } catch (error) {
      debugPrint(error.toString());
      emit(HomeFailure());
    }
  }
   void getNewProducts() {
    emit(HomeLoading());
    try {
      homeRepo.getNewProducts();
      emit(HomeSuccess());
    } catch (error) {
      debugPrint(error.toString());
      emit(HomeFailure());
    }
  }
}
