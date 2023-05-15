import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/presentation/presentation.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomUserState = ref.watch(randomUserProvider);
    final user = randomUserState.user;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(randomUserProvider.notifier).getRandomUser();
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
            child: Column(
              children: [
                Constants.kVerticalSpaceLarger,
                user == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : UserCard(user: user),
                TextButton(
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
                Constants.kVerticalSpaceLarger,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
