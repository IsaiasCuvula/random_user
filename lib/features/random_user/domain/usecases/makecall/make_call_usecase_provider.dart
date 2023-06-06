import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final makeCallUseCaseProvider = Provider<MakeCallUseCase>((ref) {
  return MakeCallUseCaseImpl();
});
