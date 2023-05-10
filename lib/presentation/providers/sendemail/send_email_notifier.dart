import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';

class SendEmailNotifier extends StateNotifier<Email> {
  SendEmailNotifier(this._sendEmailUseCase)
      : super(
          const Email(
            body: '',
            subject: '',
            recipient: '',
          ),
        );

  final SendEmailUseCase _sendEmailUseCase;

  Future<void> sendEmail(Email email) async {
    await _sendEmailUseCase(email);
  }
}
