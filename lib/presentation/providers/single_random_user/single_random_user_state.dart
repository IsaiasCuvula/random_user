import 'package:random_user/domain/domain.dart';

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
