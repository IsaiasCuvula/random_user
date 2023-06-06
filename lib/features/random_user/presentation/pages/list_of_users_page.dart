import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/config.dart';
import 'package:random_user/features/random_user/random_user.dart';

class ListUsersPage extends ConsumerWidget {
  const ListUsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final listRandomUserState = ref.watch(listRandomUserProvider);
    final users = listRandomUserState.users;
    final isLoading = listRandomUserState.isLoading;
    final errorMessage = listRandomUserState.erroMessage;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('List users'),
        actions: [
          IconButton(
            onPressed: () async {
              await ref
                  .read(listRandomUserProvider.notifier)
                  .fetchListRandomUsers(users?.length ?? 1);
            },
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      body: Padding(
        padding: Dimessions.kPaddingLarge,
        child: Column(
          children: [
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (errorMessage != null) DisplayMessage(message: errorMessage),
            if (users != null)
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) {
                    final user = users[index];
                    return Card(
                      child: ListTile(
                        leading: SizedBox(
                          width: 40.0,
                          child: DisplayUserImage(
                            imageUrl: '${user.picture?.thumbnail}',
                            radius: 20.0,
                          ),
                        ),
                        title: DisplayUserName(
                          user: user,
                          style: textTheme.headlineSmall,
                        ),
                        onTap: () {
                          context.pushNamed(
                            RoutesName.userDetail,
                            extra: user,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
