import 'user/user.dart';

class RandomUser extends User {
  const RandomUser({
    required String gender,
    Username? name,
    Location? location,
    required String nat,
    Picture? picture,
    required String phone,
    required String email,
  }) : super(
          gender: gender,
          name: name,
          location: location,
          nat: nat,
          picture: picture,
          phone: phone,
          email: email,
        );
}
