import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/app_colors.dart';
import 'utils/app_routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.kBackgroundColor,
      statusBarIconBrightness: Brightness.dark
    ),
  );
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.kPrimaryColor,
        fontFamily: 'Metropolis',
        scaffoldBackgroundColor: AppColors.kBackgroundColor,
      ),
    );
  }
}
