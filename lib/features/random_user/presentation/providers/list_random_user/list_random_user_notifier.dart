import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

class ListRandomUsersNotifier extends StateNotifier<ListRandomUsersState> {
  ListRandomUsersNotifier(this._randomUserRepository)
      : super(const ListRandomUsersState(isLoading: false));

  final RandomUserRepository _randomUserRepository;

  Future<void> fetchListRandomUsers(int number) async {
    state = const ListRandomUsersState(isLoading: true);
    final result = await _randomUserRepository.getListOfRandomUsers(number);
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
