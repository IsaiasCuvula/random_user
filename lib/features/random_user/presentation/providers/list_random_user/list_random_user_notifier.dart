import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

class ListRandomUsersNotifier extends StateNotifier<ListRandomUsersState> {
  ListRandomUsersNotifier(this._randomUsers)
      : super(const ListRandomUsersState(isLoading: false));

  final GetListOfRandomUsers _randomUsers;

  Future<void> fetchListRandomUsers(int number) async {
    state = const ListRandomUsersState(isLoading: true);
    final result = await _randomUsers(number);
    state = result.fold(
      (failure) => ListRandomUsersState(
        isLoading: false,
        erroMessage: Helpers.failureToMessage(failure),
      ),
      (randomUsers) => ListRandomUsersState(
        users: randomUsers,
        isLoading: false,
      ),
    );
  }
}
