import 'package:random_user/features/random_user/random_user.dart';

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
