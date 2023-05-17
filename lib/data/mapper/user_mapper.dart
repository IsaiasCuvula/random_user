import 'package:random_user/data/data.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/utils/utils.dart';

class UserMapper {
  static RandomUserModel fromJson(Map<String, dynamic> map) {
    final user = map['results'].first;
    return _mapToRandomUserModel(user);
  }

  static ListUsersModel fromJsonList(Map<String, dynamic> map) {
    final usersResult = map['results'];
    ListUsersModel usersList = [];

    for (var user in usersResult) {
      final randomUser = _mapToRandomUserModel(user);
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

  static RandomUserModel _mapToRandomUserModel(dynamic user) {
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
