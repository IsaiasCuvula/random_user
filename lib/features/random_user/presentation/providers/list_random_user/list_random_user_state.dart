import 'package:equatable/equatable.dart';
import 'package:random_user/features/random_user/random_user.dart';

class ListRandomUsersState extends Equatable {
  final ListUsers? users;
  final bool isLoading;
  final String? errorMessage;

  const ListRandomUsersState({
    this.users,
    this.errorMessage,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [users, isLoading, errorMessage];
}
