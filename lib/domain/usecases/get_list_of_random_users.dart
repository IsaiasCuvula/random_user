import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class GetListOfRandomUsers {
  final RandomUserRepository _userRepository;

  GetListOfRandomUsers(this._userRepository);

  Future<ListUsers> call(int number) async {
    return await _userRepository.getListOfRandomUsers(number);
  }
}
