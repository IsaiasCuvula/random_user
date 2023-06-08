import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final listRandomUserProvider =
    StateNotifierProvider<ListRandomUsersNotifier, ListRandomUsersState>((ref) {
  final randomUsersUsecase = ref.read(getListRandomUsersUseCaseProvider);
  return ListRandomUsersNotifier(randomUsersUsecase);
});
