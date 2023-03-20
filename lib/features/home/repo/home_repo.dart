import '../model/product_model.dart';

abstract class HomeRepo {
  Stream<List<ProductModel>> getNewProducts();
  Stream<List<ProductModel>> getSaleProducts();
}
