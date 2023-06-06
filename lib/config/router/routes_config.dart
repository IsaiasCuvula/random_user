import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/features/random_user/random_user.dart';
import 'routes.dart';

class RoutesConfig {
  static final navigationKey = GlobalKey<NavigatorState>();
  static final routeConfig = GoRouter(
    initialLocation: '/',
    navigatorKey: navigationKey,
    routes: routes,
    errorPageBuilder: (ctx, state) => MaterialPage(
      key: state.pageKey,
      child: const ErrorPage(),
    ),
  );
}
