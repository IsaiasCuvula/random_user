import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

final randomUserProvider =
    StateNotifierProvider<RandomUserNotifier, RandomUserState>((ref) {
  final randomUserRepository = ref.read(userRepositoryProvider);
  return RandomUserNotifier(randomUserRepository);
});
