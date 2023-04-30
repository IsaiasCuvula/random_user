import 'package:random_user/data/models/usermodel/user_model.dart';
import 'package:random_user/domain/entities/userentity/user_entity.dart';
import 'package:random_user/presentation/presentation.dart';

class UserMapper {
  static UserEntity userMapper(UserModel userModel) {
    return UserEntity(
      gender: userModel.gender,
      city: userModel.city,
      state: userModel.state,
      country: userModel.country,
      postcode: userModel.postcode,
      nat: userModel.nat,
      phone: userModel.phone,
      email: userModel.email,
    );
  }

  static ListUsers listUserMapper(ListUsersModel listUsersModel) {
    return listUsersModel
        .map((userModel) => UserMapper.userMapper(userModel))
        .toList();
  }
}
