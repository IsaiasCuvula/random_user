import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

class SendEmailNotifier extends StateNotifier<SendEmailState> {
  SendEmailNotifier(this._sendEmailUseCase) : super(SendEmailState());

  final SendEmailUseCase _sendEmailUseCase;

  Future<void> sendEmail(Email email) async {
    final result = await _sendEmailUseCase(email);
    state = result.fold(
      (failure) => SendEmailState(
        erroMessage: Helpers.failureToMessage(failure),
      ),
      (isSendingEmail) => SendEmailState(result: isSendingEmail),
    );
  }
}
