part of 'user.dart';

@immutable
class Picture {
  final String? large;
  final String? medium;
  final String? thumbnail;

  const Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
