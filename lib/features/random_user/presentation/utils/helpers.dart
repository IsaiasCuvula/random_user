import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/router/router.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';

class Helpers {
  static int stringToInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      return 0;
    }
  }

  static AlertDialog dialod(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    return AlertDialog(
      title: const Text('How many users do you want to see?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (stringToInt(controller.text) > 0) {
              await ref
                  .read(listRandomUserProvider.notifier)
                  .fetchListRandomUsers(
                    stringToInt(controller.text),
                  )
                  .then((value) {
                context.pushNamed(RoutesName.listUsers).then((value) {
                  context.pop();
                  controller.dispose();
                });
              });
            } else {
              const msg = 'Please insert a valid number or greater than zero!';
              showSnackBar(context, msg);
            }
          },
          child: const Text('See users'),
        ),
      ],
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static String failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.kServerFailureMessage;
      case CacheFailure:
        return Constants.kCacheFailureMessage;
      case ParsingJsonFailure:
        return Constants.kParsingJsonFailureMessage;
      case SendingEmailFailure:
        return Constants.kSendingEmailMessage;
      case MakingCallFailure:
        return Constants.kMakingCallMessage;
      default:
        return 'Unexpected error';
    }
  }
}
