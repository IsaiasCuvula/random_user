import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/router/router.dart';
import 'package:random_user/presentation/presentation.dart';

class Helpers {
  static int stringToInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      return 0;
    }
  }

  static AlertDialog dialod(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('How many users do you want to see?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) async {
              await ref
                  .read(
                    randomUserProvider.notifier,
                  )
                  .fetchListRandomUsers(
                    stringToInt(value),
                  );
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => context
              .pushNamed(
            RoutesName.listUsers,
          )
              .then((value) {
            context.pop();
          }),
          child: const Text('See users'),
        ),
      ],
    );
  }
}
