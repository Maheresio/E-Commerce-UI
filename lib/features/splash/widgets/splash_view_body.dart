import 'package:e_commerce_app/features/auth/repos/auth_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_routes.dart';
import '../../../core/utils/asset_data.dart';

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
    final repo = GetIt.I.get<AuthRepoImp>();
    repo.authStateChanges().listen((event) {
      event != null
          ? Future.delayed(const Duration(seconds: 5), () {
              if (mounted) {
                GoRouter.of(context)
                    .pushReplacement(AppRoutes.kNavBarViewRoute);
              }
            })
          : Future.delayed(
              const Duration(seconds: 5),
              () {
                if (mounted) {
                  GoRouter.of(context)
                      .pushReplacement(AppRoutes.kAuthViewRoute);
                }
              },
            );
    });
  }
}
