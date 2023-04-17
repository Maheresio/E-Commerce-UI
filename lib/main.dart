import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/global/themes/themes_data/theme_data_light.dart';
import 'core/helpers/custom_status_bar.dart';
import 'core/helpers/firebase_init.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/service_locator.dart';
import 'core/widgets/internet_not_connected.dart';

void main() async {
  await firebaseInit();
  customStatusBar();
  setupServiceLocator();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            return snapshot.data == ConnectivityResult.mobile ||
                    snapshot.data == ConnectivityResult.wifi
                ? GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: MaterialApp.router(
                      routerConfig: AppRoutes.router,
                      debugShowCheckedModeBanner: false,
                      theme: getThemeDataLight(context),
                    ),
                  )
                : const MaterialApp(
                    home: InternetNotConnected(),
                    debugShowCheckedModeBanner: false,
                  );
          },
        );
      },
    ),
  );
}
