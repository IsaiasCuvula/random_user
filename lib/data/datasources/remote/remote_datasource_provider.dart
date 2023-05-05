import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/data/data.dart';

final remoteDataSourceProvider =
    Provider.family<UserRemoteDataSource, UserHttpClient>((_, httpClient) {
  return UserRemoteDataSourceImpl(httpClient: httpClient);
});
