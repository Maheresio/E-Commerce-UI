import '../../cart/model/product_cart_model.dart';
import '../model/product_model.dart';

abstract class HomeRepo {
  Stream<List<ProductModel>> getNewProducts();
  Stream<List<ProductModel>> getSaleProducts();
  Future<void> addToCart(ProductCartModel product);
}
