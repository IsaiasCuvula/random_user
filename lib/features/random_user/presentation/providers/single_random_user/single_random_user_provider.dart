import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final singleRandomUserProvider =
    StateNotifierProvider<SingleRandomUserNotifier, SingleRandomUserState>(
        (ref) {
  final getRandomUser = ref.read(getRandomUserUseCaseProvider);
  return SingleRandomUserNotifier(getRandomUser);
});
