import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';

abstract class MakeCallUseCase {
  Future<Either<Failure, bool>> execute(String phoneNumber);
}
