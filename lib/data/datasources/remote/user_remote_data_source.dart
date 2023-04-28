import 'package:random_user/data/data.dart';
import 'package:random_user/presentation/presentation.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getRandomUser();
  Future<ListUserModel> getListOfRandomUsers(int number);
}
