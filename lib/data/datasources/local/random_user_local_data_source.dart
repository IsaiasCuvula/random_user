import 'package:random_user/data/data.dart';
import 'package:random_user/presentation/presentation.dart';

abstract class RandomUserLocalDataSource {
  Future<RandomUserModel> getLastRandomUser();
  Future<ListUsersModel> getAllCachedRandomUsers();
  Future<int> cacheRandomUser(RandomUserModel userToCache);
}
