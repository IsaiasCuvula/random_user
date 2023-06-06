import 'package:random_user/features/random_user/random_user.dart';

class RandomUserModel extends User {
  const RandomUserModel({
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

  @override
  List<Object?> get props => [
        gender,
        name,
        location,
        nat,
        picture,
        phone,
        email,
      ];
}
