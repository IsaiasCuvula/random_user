import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';

class RandomUserRepositoryImpl extends RandomUserRepository {
  final RandomUserRemoteDataSource remoteDataSource;
  final RandomUserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  RandomUserRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ListUsers>> getListOfRandomUsers(int number) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final listUser = await remoteDataSource.getListOfRandomUsers(number);
        final listRandomUser = listUser.map((user) {
          localDataSource.cacheRandomUser(user);
          return UserMapper.toEntity(user);
        });

        return Right(listRandomUser.toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localListUserModel =
            await localDataSource.getAllCachedRandomUsers();
        final users =
            localListUserModel.map((user) => UserMapper.toEntity(user));
        return right(users.toList());
      } on CacheException catch (_) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, RandomUser>> getRandomUser() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final userModel = await remoteDataSource.getRandomUser();
        await localDataSource.cacheRandomUser(userModel);
        return Right(UserMapper.toEntity(userModel));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUserModel = await localDataSource.getLastRandomUser();
        return right(UserMapper.toEntity(localUserModel));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
