import 'package:random_user/domain/entities/userentity/user_entity.dart';
import 'package:random_user/domain/repositories/random_user_repository.dart';
import 'package:random_user/presentation/utils/types.dart';

class RandomUserRepositoryImpl extends RandomUserRepository {
  @override
  Future<ListUser> getListOfRandomUsers(int quantity) {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getRandomUser() {
    throw UnimplementedError();
  }
}
