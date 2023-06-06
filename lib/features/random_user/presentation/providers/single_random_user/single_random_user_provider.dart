import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final singleRandomUserProvider =
    StateNotifierProvider<SingleRandomUserNotifier, SingleRandomUserState>(
        (ref) {
  final randomUserRepository = ref.read(userRepositoryProvider);
  return SingleRandomUserNotifier(randomUserRepository);
});
