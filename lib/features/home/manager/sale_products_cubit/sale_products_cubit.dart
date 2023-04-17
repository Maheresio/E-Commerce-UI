import 'package:bloc/bloc.dart';
import '../../../../core/error/firebase_firestore_exceptions.dart';
import '../../../../core/utils/service_locator.dart';
import '../../model/product_model.dart';
import '../../repo/home_repo_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'sale_products_state.dart';

class SaleProductsCubit extends Cubit<SaleProductsState> {
  SaleProductsCubit() : super(SaleProductsInitial());

  Future<void> getSaleProducts() async {
    emit(SaleProductsLoading());
    try {
      final saleProductsList =
          await getIt.get<HomeRepoImp>().getSaleProducts().first;

      emit(SaleProductsSuccess(saleProductsList));
    } catch (error) {
      if (error is FirebaseException) {
        emit(SaleProductsFailure(handleFirestoreException(error)));
      } else {
        emit(SaleProductsFailure(error.toString()));
      }
    }
  }
}
