import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
part 'username.dart';
part 'picture.dart';
part 'location.dart';
part 'coordinates.dart';

@immutable
class User extends Equatable {
  final String? gender;
  final Username? name;
  final Location? location;
  final String? email;
  final String? phone;
  final Picture? picture;
  final String? nat;
  final Coordinates? coordinates;

  const User({
    this.gender,
    this.name,
    this.location,
    this.nat,
    this.picture,
    this.phone,
    this.email,
    this.coordinates,
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
        coordinates,
      ];
}
