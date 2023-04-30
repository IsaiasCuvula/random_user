part of 'user_model.dart';

@freezed
class Timezone with _$Timezone {
  const factory Timezone({
    required String offset,
    required String description,
  }) = _Timezone;

  factory Timezone.fromJson(Map<String, dynamic> json) =>
      _$TimezoneFromJson(json);
}
