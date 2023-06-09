import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/router/router.dart';
import 'package:random_user/features/random_user/random_user.dart';

final routes = [
  GoRoute(
    path: '/',
    name: RoutesName.home,
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const HomePage(),
    routes: [
      GoRoute(
        path: 'user-detail',
        name: RoutesName.userDetail,
        parentNavigatorKey: RoutesConfig.navigationKey,
        pageBuilder: (context, state) {
          final RandomUser user = state.extra as RandomUser;
          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailPage(user: user),
            transitionsBuilder: (ctx, animation, animation2, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: 'list-user',
        name: RoutesName.listUsers,
        parentNavigatorKey: RoutesConfig.navigationKey,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ListUsersPage(),
            transitionsBuilder: (ctx, animation, animation2, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  ),
];
