import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final makeCallProvider =
    StateNotifierProvider.autoDispose<MakeCallNotifier, MakeCallState>((ref) {
  final makeCallUseCase = ref.watch(makeCallUseCaseProvider);
  return MakeCallNotifier(makeCallUseCase);
});
