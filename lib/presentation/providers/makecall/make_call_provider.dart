import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/usecases/makecall/makecall.dart';
import 'package:random_user/presentation/presentation.dart';

final makeCallProvider =
    StateNotifierProvider.autoDispose<MakeCallNotifier, MakeCallState>((ref) {
  final makeCallUseCase = ref.watch(makeCallUseCaseProvider);
  return MakeCallNotifier(makeCallUseCase);
});
