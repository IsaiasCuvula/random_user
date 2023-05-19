import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

final listRandomUserProvider =
    StateNotifierProvider<ListRandomUsersNotifier, ListRandomUsersState>((ref) {
  final randomUserRepository = ref.read(userRepositoryProvider);
  return ListRandomUsersNotifier(randomUserRepository);
});
