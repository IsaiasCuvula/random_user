import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

abstract class RandomUserRepository {
  Future<UserEntity> getRandomUser();
  Future<ListUser> getListOfRandomUsers(int quantity);
}
