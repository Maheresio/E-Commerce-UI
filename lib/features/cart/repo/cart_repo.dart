import '../model/product_cart_model.dart';

abstract class CartRepo {
  Future<List<ProductCartModel>> getCartProducts();
}
