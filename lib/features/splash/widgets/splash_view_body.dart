import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_routes.dart';
import '../../../core/utils/asset_data.dart';
import '../../../core/utils/service_locator.dart';
import '../../auth/repos/auth_repo_imp.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetData.kSplashviewImage,
      ),
    );
  }

  void navToHome() {
     final repo = getIt.get<AuthRepoImp>();

    Future.delayed(const Duration(seconds: 5), () {
      repo.authStateChanges().listen((user) {
        user != null
            ? GoRouter.of(context).pushReplacement(AppRoutes.kNavBarViewRoute)
            : GoRouter.of(context).pushReplacement(AppRoutes.kAuthViewRoute);
      });
    });
  }
}
