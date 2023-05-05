part of 'user.dart';

@immutable
class Username {
  final String? title;
  final String? first;
  final String? last;

  const Username({
    this.title,
    this.first,
    this.last,
  });

  factory Username.fromJson(Map<String, dynamic> json) {
    return Username(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}
