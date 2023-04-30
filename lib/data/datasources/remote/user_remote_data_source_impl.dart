import 'package:random_user/data/data.dart';
import 'package:random_user/presentation/presentation.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserHttpClient httpClient;

  UserRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<ListUsersModel> getListOfRandomUsers(int number) async {
    final url = '${Constants.apiUrl}/?results=$number';
    return await httpClient.request(url: url);
  }

  @override
  Future<UserModel> getRandomUser() async {
    const url = Constants.apiUrl;
    return await httpClient.request(url: url);
  }
}
