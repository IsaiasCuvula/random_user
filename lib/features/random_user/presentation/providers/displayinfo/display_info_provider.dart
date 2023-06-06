import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final displayInfoProvider =
    StateNotifierProvider<DisplayInfoNotifier, String>((ref) {
  final user = ref.watch(singleRandomUserProvider).user;
  final username =
      '${user?.name?.title} ${user?.name?.first} ${user?.name?.last}';
  return DisplayInfoNotifier(username);
});
