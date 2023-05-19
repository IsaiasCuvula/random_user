import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class GetListOfRandomUsers {
  final RandomUserRepository _userRepository;

  GetListOfRandomUsers(this._userRepository);

  Future<Either<Failure, ListUsers>> call(int number) async {
    return await _userRepository.getListOfRandomUsers(number);
  }
}
