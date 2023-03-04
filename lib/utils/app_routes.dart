import 'package:e_commerce_app/views/pages/auth_view.dart';
import 'package:e_commerce_app/views/pages/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {

  static const kHomeViewRoute='/authView';



 static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
       GoRoute(
        path: kHomeViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthView();
        },
      ),
    ],
  );
}
