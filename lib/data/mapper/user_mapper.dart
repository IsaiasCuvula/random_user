import 'package:random_user/data/data.dart';
import 'package:random_user/domain/domain.dart';

class UserMapper {
  static RandomUserModel fromJson(Map<String, dynamic> map) {
    final user = map['results'][0];
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

  static List<RandomUserModel> fromJsonList(Map<String, dynamic> map) {
    final usersResult = map['results'];
    List<RandomUserModel> usersList = [];

    for (var user in usersResult) {
      final randomUser = RandomUserModel(
        gender: user['gender'],
        name: Username.fromJson(user['name']),
        location: Location.fromJson(user['location']),
        nat: user['nat'],
        picture: Picture.fromJson(user['picture']),
        phone: user['phone'],
        email: user['email'],
      );
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
}
