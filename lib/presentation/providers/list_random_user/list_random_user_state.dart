import 'package:random_user/presentation/presentation.dart';

class ListRandomUsersState {
  final ListUsers? users;
  final bool isLoading;
  final String? erroMessage;

  const ListRandomUsersState({
    this.users,
    this.erroMessage,
    required this.isLoading,
  });
}
