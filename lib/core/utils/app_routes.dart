import 'package:e_commerce_app/bottom_nav_bar.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/auth/manager/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/repos/auth_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/views/auth_view.dart';
import '../../features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kAuthViewRoute = '/authView';
  static const kNavBarViewRoute = '/navBarView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kAuthViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthCubit(authRepo: getIt.get<AuthRepoImp>()),
            child: const AuthView(),
          );
        },
      ),
      GoRoute(
        path: kNavBarViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const BottomNavBar();
        },
      ),
    ],
  );
}
