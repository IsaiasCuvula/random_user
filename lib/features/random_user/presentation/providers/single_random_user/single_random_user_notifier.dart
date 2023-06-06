import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

class SingleRandomUserNotifier extends StateNotifier<SingleRandomUserState> {
  SingleRandomUserNotifier(this._randomUserRepository)
      : super(const SingleRandomUserState(isLoading: false)) {
    getRandomUser();
  }

  final RandomUserRepository _randomUserRepository;

  Future<void> getRandomUser() async {
    state = const SingleRandomUserState(isLoading: true);
    final result = await _randomUserRepository.getRandomUser();

    state = result.fold(
      (failure) => SingleRandomUserState(
        isLoading: false,
        erroMessage: Helpers.failureToMessage(failure),
      ),
      (randomUser) => SingleRandomUserState(
        isLoading: false,
        user: randomUser,
      ),
    );
  }
}
