part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartSuccess extends CartState {
  final List<ProductCartModel> cartList;

  CartSuccess(this.cartList);
}

class CartLoading extends CartState {}

class CartFailure extends CartState {
  final String errorMsg;

  CartFailure(this.errorMsg);
}
