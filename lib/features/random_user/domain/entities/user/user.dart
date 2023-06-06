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
}
