import 'package:random_user/core/core.dart';
import 'package:random_user/data/data.dart';
import 'package:random_user/presentation/presentation.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserHttpClient httpClient;

  UserRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<ListUsersModel> getListOfRandomUsers(int number) async {
    final url = '${ApiUrls.randomUserBaseUrl}/?results=$number';
    return await httpClient.request(url: url, isListRequest: true);
  }

  @override
  Future<RandomUserModel> getRandomUser() async {
    const url = ApiUrls.randomUserBaseUrl;
    return await httpClient.request(url: url);
  }
}
