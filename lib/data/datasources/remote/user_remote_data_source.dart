import 'package:random_user/data/data.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getRandomUser();
  Future<List<UserModel>> getListOfRandomUsers(int number);
}
