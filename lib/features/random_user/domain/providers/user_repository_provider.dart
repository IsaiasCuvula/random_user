import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';

final userRepositoryProvider =
    Provider.autoDispose<RandomUserRepository>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  final remoteDataSource =
      ref.watch(randomUserRemoteDataSourceProvider(httpClient));
  final localDataSource = ref.watch(randomUserLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return RandomUserRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
  );
});
