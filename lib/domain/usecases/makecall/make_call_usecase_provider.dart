import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';

final makeCallUseCaseProvider = Provider<MakeCallUseCase>((ref) {
  return MakeCallUseCaseImpl();
});
