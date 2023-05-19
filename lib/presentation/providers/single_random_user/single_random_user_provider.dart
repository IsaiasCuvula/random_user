import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';
import 'single_random_user.dart';

final singleRandomUserProvider =
    StateNotifierProvider<SingleRandomUserNotifier, SingleRandomUserState>(
        (ref) {
  final randomUserRepository = ref.read(userRepositoryProvider);
  return SingleRandomUserNotifier(randomUserRepository);
});
