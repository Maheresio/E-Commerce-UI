import '../../../core/utils/firebase_api_paths.dart';
import '../../cart/model/product_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/firebase_service.dart';
import '../../../core/utils/service_locator.dart';
import '../model/product_model.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  //don't understand
  final _fireServices = getIt.get<FirebaseServices>();

  @override
  Stream<List<ProductModel>> getNewProducts() =>
      _fireServices.getCollectionStream(
        collectionPath: FirebaseApiPaths.productsPath(),
        builder: ((data, documentId) =>
            ProductModel.fromMap(data!, documentId)),
      );

  @override
  Stream<List<ProductModel>> getSaleProducts() =>
      _fireServices.getCollectionStream(
        collectionPath: FirebaseApiPaths.productsPath(),
        builder: ((data, documentId) =>
            ProductModel.fromMap(data!, documentId)),
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
      );

  @override
  Future<void> addToCart(ProductCartModel product) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String uid = prefs.getString('uid')!;

    await _fireServices.setData(
      documentPath:
          FirebaseApiPaths.addToCartPath(uid, DateTime.now().toIso8601String()),
      data: product.toMap(),
    );
  }
}
