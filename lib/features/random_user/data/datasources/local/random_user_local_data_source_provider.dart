import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final randomUserLocalDataSourceProvider =
    Provider.autoDispose<RandomUserLocalDataSource>((ref) {
  return RandomUserLocalDataSourceImpl();
});
