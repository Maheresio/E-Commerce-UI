import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/error/firebase_firestore_exceptions.dart';
import 'package:e_commerce_app/features/cart/model/product_cart_model.dart';
import 'package:e_commerce_app/features/cart/repo/cart_repo_impl.dart';
import 'package:meta/meta.dart';
import '../../../../core/utils/service_locator.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getProductsCart() async {
    emit(CartLoading());
    try {
      final cartList = await getIt.get<CartRepoImpl>().getCartProducts();
      emit(CartSuccess(cartList));
    } catch (error) {
      if (error is FirebaseException) {
        emit(CartFailure(handleFirestoreException(error)));
      } else {
        emit(CartFailure(error.toString()));
      }
    }
  }
}
