import 'package:random_user/data/data.dart';
import 'package:random_user/presentation/presentation.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserHttpClient userClient;

  UserRemoteDataSourceImpl({required this.userClient});

  @override
  Future<ListUserModel> getListOfRandomUsers(int number) async {
    final url = '${Constants.apiUrl}/?results=$number';
    return await userClient.request(url: url);
  }

  @override
  Future<UserModel> getRandomUser() async {
    const url = Constants.apiUrl;
    return await userClient.request(url: url);
  }
}
