import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/router/router.dart';
import 'package:random_user/presentation/presentation.dart';

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
        //builder: (context, state) => const DetailPage(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const DetailPage(),
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
