import 'package:flutter/material.dart';
import 'package:random_user/config/theme.dart';
import 'package:random_user/presentation/presentation.dart';

class RandomUser extends StatelessWidget {
  const RandomUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random User',
      theme: RandomUserTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
