import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
part 'username.dart';
part 'picture.dart';
part 'location.dart';

@immutable
class User extends Equatable {
  final String? gender;
  final Username? name;
  final Location? location;
  final String? email;
  final String? phone;
  final Picture? picture;
  final String? nat;

  const User({
    this.gender,
    this.name,
    this.location,
    this.nat,
    this.picture,
    this.phone,
    this.email,
  });

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          gender == other.gender &&
          name == other.name &&
          location == other.location &&
          nat == other.nat &&
          picture == other.picture &&
          phone == other.phone &&
          email == other.email;

  @override
  int get hashCode =>
      gender.hashCode ^
      name.hashCode ^
      location.hashCode ^
      nat.hashCode ^
      picture.hashCode ^
      phone.hashCode ^
      email.hashCode;
}
