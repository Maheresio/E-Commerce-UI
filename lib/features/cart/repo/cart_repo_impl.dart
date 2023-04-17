import 'package:e_commerce_app/core/utils/firebase_api_paths.dart';
import 'package:e_commerce_app/core/utils/firebase_service.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/cart/model/product_cart_model.dart';
import 'package:e_commerce_app/features/cart/repo/cart_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepoImpl implements CartRepo {
  final _fireServices = getIt.get<FirebaseServices>();

  @override
  Future<List<ProductCartModel>> getCartProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String uid = prefs.getString('uid')!;
    return _fireServices
        .getCollectionStream(
          collectionPath: FirebaseApiPaths.getCartProductsPath(uid),
          builder: (data, documentId) =>
              ProductCartModel.fromMap(data!, documentId),
        )
        .first;
  }
}
