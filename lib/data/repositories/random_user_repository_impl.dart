import 'package:random_user/data/datasources/datasources.dart';
import 'package:random_user/data/mappers/user_mapper.dart';
import 'package:random_user/domain/entities/userentity/user_entity.dart';
import 'package:random_user/domain/exceptions/exceptions.dart';
import 'package:random_user/domain/repositories/random_user_repository.dart';
import 'package:random_user/presentation/utils/types.dart';

class RandomUserRepositoryImpl extends RandomUserRepository {
  final UserRemoteDataSource remoteDataSource;
  //Local datasource & network info;
  RandomUserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ListUsers> getListOfRandomUsers(int number) async {
    try {
      final listUser = await remoteDataSource.getListOfRandomUsers(number);
      return UserMapper.listUserMapper(listUser);
    } on ServerException {
      throw ServerException();
    }
  }

  @override
  Future<UserEntity> getRandomUser() async {
    try {
      final userModel = await remoteDataSource.getRandomUser();
      return UserMapper.userMapper(userModel);
    } on ServerException {
      throw ServerException();
    }
  }
}
