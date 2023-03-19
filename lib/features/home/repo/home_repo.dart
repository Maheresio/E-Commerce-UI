import 'package:e_commerce_app/features/home/model/product_model.dart';

abstract class HomeRepo {
  Stream<List<ProductModel>> getProducts();
}
