import 'package:random_user/features/random_user/random_user.dart';

abstract class RandomUserRemoteDataSource {
  Future<RandomUserModel> getRandomUser();
  Future<ListUsersModel> getListOfRandomUsers(int number);
}
