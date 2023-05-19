import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

abstract class RandomUserRepository {
  Future<Either<Failure, RandomUser>> getRandomUser();
  Future<Either<Failure, ListUsers>> getListOfRandomUsers(int number);
}
