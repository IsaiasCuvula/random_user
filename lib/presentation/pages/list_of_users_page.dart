import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/config.dart';
import 'package:random_user/presentation/presentation.dart';

class ListUsersPage extends ConsumerWidget {
  const ListUsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final users = ref.read(randomUserProvider).users;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('List users'),
      ),
      body: Padding(
        padding: Constants.kPaddingLarge,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, index) {
            final user = users[index];
            return Card(
              child: ListTile(
                leading: DisplayUserImage(
                  imageUrl: '${user.picture?.thumbnail}',
                  radius: 20.0,
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
    );
  }
}
