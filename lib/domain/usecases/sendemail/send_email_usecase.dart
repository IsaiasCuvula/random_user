import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/domain/domain.dart';

abstract class SendEmailUseCase {
  Future<Either<Failure, bool>> call(Email email);
}
