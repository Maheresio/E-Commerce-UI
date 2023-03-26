import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/global/themes/themes_data/theme_data_light.dart';
import 'core/helpers/custom_status_bar.dart';
import 'core/helpers/firebase_init.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/service_locator.dart';

void main() async {
  await firebaseInit();
  customStatusBar();
 setupServiceLocator();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp.router(
            routerConfig: AppRoutes.router,
            debugShowCheckedModeBanner: false,
            theme: getThemeDataLight(context),
          );
        });
  }
}
