part of 'user_entity.dart';

@immutable
class Location {
  final Street street;

  const Location({
    required this.street,
  });
}

@immutable
class Street {
  final int number;
  final String name;

  const Street({
    required this.number,
    required this.name,
  });
}
