import 'package:e_commerce_app/core/utils/firebase_service.dart';
import 'package:e_commerce_app/features/auth/repos/auth_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
}
