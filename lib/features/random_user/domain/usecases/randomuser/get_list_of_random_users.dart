import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';

class GetListOfRandomUsers {
  final RandomUserRepository _userRepository;

  GetListOfRandomUsers(this._userRepository);

  Future<Either<Failure, ListUsers>> call(int number) async {
    return await _userRepository.getListOfRandomUsers(number);
  }
}
