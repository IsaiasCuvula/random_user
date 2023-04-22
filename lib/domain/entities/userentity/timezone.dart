part of 'user_entity.dart';

@immutable
class Timezone {
  final String offset;
  final String description;

  const Timezone({
    required this.offset,
    required this.description,
  });
}
