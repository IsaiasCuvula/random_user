part of 'user_model.dart';

@freezed
class Username with _$Username {
  const factory Username({
    required String title,
    required String first,
    required String last,
  }) = _Username;

  factory Username.fromJson(Map<String, dynamic> json) =>
      _$UsernameFromJson(json);
}
