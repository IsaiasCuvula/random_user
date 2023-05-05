part of 'user.dart';

@immutable
class Location {
  final String? city;
  final String? state;
  final String? country;
  final int? postcode;

  const Location({
    this.city,
    this.state,
    this.country,
    this.postcode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
    );
  }
}
