import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';
part 'username.dart';
part 'picture.dart';
part 'timezone.dart';
part 'location.dart';
part 'coordinates.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String gender,
    required Username name,
    required Location location,
    required String city,
    required String state,
    required String country,
    required int postcode,
    required Coordinates coordinates,
    required Timezone timezone,
    required String email,
    required String phone,
    required Picture picture,
    required String nat,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
