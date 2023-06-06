import 'package:random_user/features/random_user/random_user.dart';

class UserMapper {
  static RandomUserModel fromJson(Map<String, dynamic> map) {
    final user = map['results'].first;
    return mapToRandomUserModel(user);
  }

  static Map<String, dynamic> toJson(RandomUserModel randomUser) {
    return {
      'gender': randomUser.gender,
      'name': randomUser.name.toString(),
      'location': randomUser.location.toString(),
      'email': randomUser.email,
      'phone': randomUser.phone,
      'picture': randomUser.picture.toString(),
      'nat': randomUser.nat,
    };
  }

  static ListUsersModel fromJsonList(Map<String, dynamic> map) {
    final usersResult = map['results'];
    ListUsersModel usersList = [];
    for (var user in usersResult) {
      final randomUser = mapToRandomUserModel(user);
      usersList.add(randomUser);
    }
    return usersList;
  }

  static RandomUser toEntity(RandomUserModel model) {
    return RandomUser(
      gender: model.gender.toString(),
      name: model.name,
      location: model.location,
      nat: model.nat.toString(),
      picture: model.picture,
      phone: model.phone.toString(),
      email: model.email.toString(),
    );
  }

  static RandomUserModel mapToRandomUserModel(dynamic user) {
    return RandomUserModel(
      gender: user['gender'],
      name: Username.fromJson(user['name']),
      location: Location.fromJson(user['location']),
      nat: user['nat'],
      picture: Picture.fromJson(user['picture']),
      phone: user['phone'],
      email: user['email'],
    );
  }
}
