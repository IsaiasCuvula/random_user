import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final getRandomUserUseCaseProvider = Provider<GetRandomUser>((ref) {
  final repository = ref.read(userRepositoryProvider);
  return GetRandomUser(repository);
});
