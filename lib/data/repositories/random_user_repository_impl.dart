import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/data/data.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/utils/types.dart';

class RandomUserRepositoryImpl extends RandomUserRepository {
  final UserRemoteDataSource remoteDataSource;
  //Local datasource & network info;
  RandomUserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ListUsers>> getListOfRandomUsers(int number) async {
    try {
      final listUser = await remoteDataSource.getListOfRandomUsers(number);
      final listRandomUser = listUser.map((user) => UserMapper.toEntity(user));
      return Right(listRandomUser.toList());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RandomUser>> getRandomUser() async {
    try {
      final userModel = await remoteDataSource.getRandomUser();
      return Right(UserMapper.toEntity(userModel));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
