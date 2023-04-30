part of 'user_entity.dart';

@immutable
class Username extends Equatable {
  final String title;
  final String first;
  final String last;

  const Username({
    required this.title,
    required this.first,
    required this.last,
  });

  @override
  List<Object?> get props => [title, first, last];
}
