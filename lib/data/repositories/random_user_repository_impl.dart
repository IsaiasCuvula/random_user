import 'package:random_user/data/data.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/utils/types.dart';

class RandomUserRepositoryImpl extends RandomUserRepository {
  final UserRemoteDataSource remoteDataSource;
  //Local datasource & network info;
  RandomUserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ListUsers> getListOfRandomUsers(int number) async {
    try {
      final listUser = await remoteDataSource.getListOfRandomUsers(number);
      //return UserMapper.listUserMapper(listUser);
      return [];
    } on ServerException {
      throw ServerException();
    }
  }

  @override
  Future<RandomUser> getRandomUser() async {
    try {
      final userModel = await remoteDataSource.getRandomUser();
      return UserMapper.toEntity(userModel);
    } on ServerException {
      throw ServerException();
    }
  }
}
