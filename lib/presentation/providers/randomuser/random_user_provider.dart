import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';
import 'randomuser.dart';

final randomUserProvider =
    StateNotifierProvider<RandomUserNotifier, RandomUserState>((ref) {
  final randomUserRepository = ref.read(userRepositoryProvider);
  return RandomUserNotifier(randomUserRepository);
});
