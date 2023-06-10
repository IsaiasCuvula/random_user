import 'package:equatable/equatable.dart';
import 'package:random_user/features/random_user/random_user.dart';

class SingleRandomUserState extends Equatable {
  final RandomUser? user;
  final bool isLoading;
  final String? errorMessage;

  const SingleRandomUserState({
    this.user,
    this.errorMessage,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [user, isLoading, errorMessage];
}
