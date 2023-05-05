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
    required this.gender,
    this.name,
    this.location,
    required this.nat,
    this.picture,
    required this.phone,
    required this.email,
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
