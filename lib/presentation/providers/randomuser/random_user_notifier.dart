import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';

import 'random_user_state.dart';

class RandomUserNotifier extends StateNotifier<RandomUserState> {
  RandomUserNotifier(this._randomUserRepository)
      : super(const RandomUserState([], null));

  final RandomUserRepository _randomUserRepository;

  @override
  RandomUserState get state {
    if (super.state.user == null) {
      getRandomUser();
    }
    return super.state;
  }

  Future<void> getRandomUser() async {
    final randomUser = await _randomUserRepository.getRandomUser();
    state = RandomUserState(state.users, randomUser);
  }
}
