import 'package:random_user/features/random_user/random_user.dart';

class SingleRandomUserState {
  final RandomUser? user;
  final bool isLoading;
  final String? erroMessage;

  const SingleRandomUserState({
    this.user,
    this.erroMessage,
    required this.isLoading,
  });
}
