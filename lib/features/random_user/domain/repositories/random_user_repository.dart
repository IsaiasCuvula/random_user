import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';

abstract class RandomUserRepository {
  Future<Either<Failure, RandomUser>> getRandomUser();
  Future<Either<Failure, ListUsers>> getListOfRandomUsers(int number);
}
