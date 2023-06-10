import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/config/config.dart';
import 'package:random_user/features/random_user/random_user.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomUserState = ref.watch(singleRandomUserProvider);
    final user = randomUserState.user;
    final isLoading = randomUserState.isLoading;
    final errorMessage = randomUserState.errorMessage;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            key: const Key('refresh_btn'),
            onPressed: () async {
              await ref.read(singleRandomUserProvider.notifier).getRandomUser();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacing.kVerticalSpaceLarger,
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  key: Key('CircularProgressIndicator'),
                ),
              ),
            if (user != null) UserCard(user: user, key: const Key('user_card')),
            if (errorMessage != null)
              DisplayMessage(
                key: const Key('DisplayMessage'),
                message: errorMessage,
              ),
            if (user == null && errorMessage != null)
              const DisplayMessage(
                message: 'Connect to the internt to fetch a Random user',
              ),
            TextButton(
              key: const Key('see_more_users_btn'),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (ctx) {
                    return Helpers.dialod(context, ref);
                  },
                );
              },
              child: const Text('See more users'),
            ),
            Spacing.kVerticalSpaceLarger,
          ],
        ),
      ),
    );
  }
}
