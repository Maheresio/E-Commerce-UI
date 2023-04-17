part of 'sale_products_cubit.dart';

@immutable
abstract class SaleProductsState {}

class SaleProductsInitial extends SaleProductsState {}

class SaleProductsLoading extends SaleProductsState {}

class SaleProductsSuccess extends SaleProductsState {
  final List<ProductModel> saleProductsList;

  SaleProductsSuccess(this.saleProductsList);
}

class SaleProductsFailure extends SaleProductsState {
  final String errorMsg;

  SaleProductsFailure(this.errorMsg);
}
