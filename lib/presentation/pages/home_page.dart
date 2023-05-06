import 'package:flutter/material.dart';
import 'package:random_user/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              //refresh to fetch another user
            },
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: const [
                  // Consumer(builder: (ctx, ref, child) {
                  //   final randomUserState = ref.watch(randomUserProvider);
                  //   final user = randomUserState.user;
                  //   return Text(
                  //     'Welcome to the home page ${user?.gender}',
                  //   ).animate().fade().scale();
                  // }),
                  Constants.kVerticalSpaceLarge,
                  UserCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
