import 'package:e_commerce_app/features/cart/repo/cart_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/repos/auth_repo_imp.dart';
import '../../features/home/repo/home_repo_imp.dart';
import 'firebase_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp());
  getIt.registerSingleton<CartRepoImpl>(CartRepoImpl());
}
