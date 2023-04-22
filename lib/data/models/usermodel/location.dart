part of 'user_model.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required Street street,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Street with _$Street {
  const factory Street({
    required int number,
    required String name,
  }) = _Street;

  factory Street.fromJson(Map<String, dynamic> json) => _$StreetFromJson(json);
}
