import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final getListRandomUsersUseCaseProvider = Provider<GetListOfRandomUsers>((ref) {
  final repository = ref.read(userRepositoryProvider);
  return GetListOfRandomUsers(repository);
});
