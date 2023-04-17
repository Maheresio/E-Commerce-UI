import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/home/model/product_model.dart';
import 'package:e_commerce_app/features/home/repo/home_repo_imp.dart';
import 'package:flutter/material.dart';

part 'sale_products_state.dart';

class SaleProductsCubit extends Cubit<SaleProductsState> {
  SaleProductsCubit() : super(SaleProductsInitial());

  Future<void> getSaleProducts() async {
    emit(SaleProductsLoading());
    try {
      final saleProductsList =
          await getIt.get<HomeRepoImp>().getSaleProducts().first;

      emit(
        SaleProductsSuccess(saleProductsList),
      );
    } catch (error) {
      emit(
        SaleProductsFailure(
          error.toString(),
        ),
      );
    }
  }
}
