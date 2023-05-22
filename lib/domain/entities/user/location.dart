part of 'user.dart';

@immutable
class Location {
  final String? city;
  final String? state;
  final String? country;
  final dynamic postcode;

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

  @override
  String toString() {
    return jsonEncode({
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
    });
  }
}
