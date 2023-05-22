import 'package:random_user/data/data.dart';
import 'package:random_user/presentation/presentation.dart';

abstract class RandomUserRemoteDataSource {
  Future<RandomUserModel> getRandomUser();
  Future<ListUsersModel> getListOfRandomUsers(int number);
}
