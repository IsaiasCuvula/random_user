import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/data/data.dart';
import 'package:random_user/domain/domain.dart';

final userRepositoryProvider = Provider<RandomUserRepository>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  final dataSource = ref.watch(remoteDataSourceProvider(httpClient));
  return RandomUserRepositoryImpl(remoteDataSource: dataSource);
});
