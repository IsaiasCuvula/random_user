import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/usecases/makecall/makecall.dart';
import 'package:random_user/presentation/presentation.dart';

final makeCallProvider = StateProvider<MakeCallNotifier>((ref) {
  final makeCallUseCase = ref.watch(makeCallUseCaseProvider);
  return MakeCallNotifier(makeCallUseCase);
});
