part of 'new_products_cubit.dart';

@immutable
abstract class NewProductsState {}

class NewProductsInitial extends NewProductsState {}

class NewProductsSuccess extends NewProductsState {
  final List<ProductModel> newProductsList;
  NewProductsSuccess(this.newProductsList);
}

class NewProductsLoading extends NewProductsState {}

class NewProductsFailure extends NewProductsState {
  final String errorMsg;
  NewProductsFailure(this.errorMsg);
}
