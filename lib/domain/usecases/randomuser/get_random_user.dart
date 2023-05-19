import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/domain/domain.dart';

class GetRandomUser {
  final RandomUserRepository _userRepository;

  GetRandomUser(this._userRepository);

  Future<Either<Failure, RandomUser>> call() async {
    return await _userRepository.getRandomUser();
  }
}
