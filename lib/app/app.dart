import 'package:flutter/material.dart';
import 'package:random_user/config/router/routes_config.dart';
import 'package:random_user/config/theme.dart';

class RandomUser extends StatelessWidget {
  const RandomUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Random User',
      theme: RandomUserTheme.darkTheme,
      routerConfig: RoutesConfig.routeConfig,
    );
  }
}
