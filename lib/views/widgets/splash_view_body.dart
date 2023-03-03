import 'package:e_commerce_app/utils/app_routes.dart';
import 'package:e_commerce_app/utils/asset_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      child: Image.asset(AssetData.kSplashviewImage),
    );
  }

  void navToHome() {
    Future.delayed(
      const Duration(seconds: 5),
      () => GoRouter.of(context).pushReplacement(AppRoutes.kHomeViewRoute),
    );
  }
}
