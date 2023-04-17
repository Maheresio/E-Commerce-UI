import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/utils/service_locator.dart';
import '../../model/product_model.dart';
import '../../repo/home_repo_imp.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/firebase_firestore_exceptions.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit() : super(NewProductsInitial());

  void getNewProduct() async {
    emit(NewProductsLoading());
    try {
      final newProductsList =
          await getIt.get<HomeRepoImp>().getNewProducts().first;
      emit(NewProductsSuccess(newProductsList));
    } catch (error) {
      if (error is FirebaseException) {
        emit(NewProductsFailure(handleFirestoreException(error)));
      } else {
        emit(NewProductsFailure(error.toString()));
      }
    }
  }
}
