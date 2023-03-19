import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/features/home/model/product_model.dart';
import 'package:e_commerce_app/features/home/repo/home_repo.dart';

import '../../../core/utils/firebase_service.dart';
import '../../../core/utils/service_locator.dart';

class HomeRepoImp implements HomeRepo {
  //don't understand
  @override
  Stream<List<ProductModel>> getProducts() =>
      getIt.get<FirebaseServices>().getCollectionStream(
            collectionPath: AppStrings.kProductsCollection,
            builder: ((data, documentId) =>
                ProductModel.fromMap(data!, documentId)),
          );
}
