import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class RandomUserState {
  final ListUsers users;
  final RandomUser? user;
  const RandomUserState(
    this.users,
    this.user,
  );
}
