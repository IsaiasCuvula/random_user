import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

final sendEmailProvider =
    StateNotifierProvider.autoDispose<SendEmailNotifier, SendEmailState>((ref) {
  final sendEmailUseCase = ref.read(sendEmailUseCaseProvider);
  return SendEmailNotifier(sendEmailUseCase);
});
