import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final sendEmailUseCaseProvider = Provider.autoDispose<SendEmailUseCase>((ref) {
  return SendEmailUseCaseImpl();
});
