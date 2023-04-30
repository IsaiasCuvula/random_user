import 'package:flutter/foundation.dart' show immutable;
import 'package:equatable/equatable.dart';
part 'username.dart';
part 'picture.dart';
part 'timezone.dart';
part 'location.dart';
part 'coordinates.dart';

@immutable
class UserEntity extends Equatable {
  final String gender;
  final Username? name;
  final Location? location;
  final String city;
  final String state;
  final String country;
  final int postcode;
  final Coordinates? coordinates;
  final Timezone? timezone;
  final String email;
  final String phone;
  final Picture? picture;
  final String nat;

  const UserEntity({
    required this.gender,
    this.name,
    this.location,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    this.coordinates,
    required this.nat,
    this.picture,
    required this.phone,
    required this.email,
    this.timezone,
  });

  @override
  List<Object?> get props => [
        gender,
        name,
        location,
        city,
        state,
        country,
        postcode,
        nat,
        picture,
        phone,
        email,
        timezone,
      ];
}
