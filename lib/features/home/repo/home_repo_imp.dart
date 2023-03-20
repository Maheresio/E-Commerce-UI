import '../../../core/utils/app_strings.dart';
import '../../../core/utils/firebase_service.dart';
import '../../../core/utils/service_locator.dart';
import '../model/product_model.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  //don't understand

  @override
  Stream<List<ProductModel>> getNewProducts() =>
      getIt.get<FirebaseServices>().getCollectionStream(
            collectionPath: AppStrings.kProductsCollection,
            builder: ((data, documentId) =>
                ProductModel.fromMap(data!, documentId)),
          );

  @override
  Stream<List<ProductModel>> getSaleProducts() =>
      getIt.get<FirebaseServices>().getCollectionStream(
            collectionPath: AppStrings.kProductsCollection,
            builder: ((data, documentId) =>
                ProductModel.fromMap(data!, documentId)),
            queryBuilder: (query) =>
                query.where('discountValue', isNotEqualTo: 0),
          );
}
