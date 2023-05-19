import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

final sendEmailProvider =
    StateNotifierProvider.autoDispose<SendEmailNotifier, SendEmailState>((ref) {
  final sendEmailUseCase = ref.read(sendEmailUseCaseProvider);
  return SendEmailNotifier(sendEmailUseCase);
});
