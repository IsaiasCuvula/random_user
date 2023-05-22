import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/data/data.dart';

final randomUserLocalDataSourceProvider =
    Provider.autoDispose<RandomUserLocalDataSource>((ref) {
  return RandomUserLocalDataSourceImpl();
});
