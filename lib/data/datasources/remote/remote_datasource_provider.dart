import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/data/data.dart';

final randomUserRemoteDataSourceProvider =
    Provider.family<RandomUserRemoteDataSource, UserHttpClient>(
        (_, httpClient) {
  return RandomUserRemoteDataSourceImpl(httpClient: httpClient);
});
