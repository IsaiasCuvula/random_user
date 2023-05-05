import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/presentation/providers/providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (ctx, ref, child) {
          final randomUserState = ref.watch(randomUserProvider);
          final user = randomUserState.user;
          return Text(
            'Welcome to the home page ${user?.gender}',
          ).animate().fade().scale();
        }),
      ),
    );
  }
}
