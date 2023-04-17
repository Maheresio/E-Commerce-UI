
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../bottom_nav_bar.dart';
import '../../features/auth/views/auth_view.dart';
import '../../features/home/model/product_model.dart';
import '../../features/home/view/product_detail_view.dart';
import '../../features/splash/view/splash_view.dart';
import '../helpers/custom_transition_page.dart';

abstract class AppRoutes {
  static const kAuthViewRoute = '/authView';
  static const kNavBarViewRoute = '/navBarView';
  static const kProductDetailViewRoute = '/productDetailView';

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
          return const AuthView();
        },
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context, state: state, child: const AuthView()),
      ),
      GoRoute(
        path: kNavBarViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const BottomNavBar();
        },
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context, state: state, child: const BottomNavBar()),
      ),
      GoRoute(
        path: kProductDetailViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return ProductDetailView(product: state.extra as ProductModel);
        },
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: ProductDetailView(product: state.extra as ProductModel),
        ),
      ),
    ],
  );
}
