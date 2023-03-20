import '../model/product_model.dart';

abstract class HomeRepo {
  Stream<List<ProductModel>> getProducts();
}
