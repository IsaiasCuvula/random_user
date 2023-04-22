part of 'user_entity.dart';

@immutable
class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  const Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });
}
