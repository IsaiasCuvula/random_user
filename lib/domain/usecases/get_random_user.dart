import 'package:random_user/domain/domain.dart';

class GetRandomUser {
  final RandomUserRepository _userRepository;

  GetRandomUser(this._userRepository);

  Future<RandomUser> call() async {
    return await _userRepository.getRandomUser();
  }
}
