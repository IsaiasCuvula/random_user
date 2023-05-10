import 'package:random_user/domain/domain.dart';
import 'package:url_launcher/url_launcher.dart';

class SendEmailUseCaseImpl implements SendEmailUseCase {
  @override
  Future<void> call(Email email) async {
    final Uri emailUrl = Uri(
      scheme: 'mailto',
      path: email.recipient,
      queryParameters: {
        'subject': email.subject,
        'body': email.body,
      },
    );

    final canLaunch = await canLaunchUrl(emailUrl);
    try {
      if (canLaunch) {
        await launchUrl(emailUrl);
      } else {
        throw "Error occured sending an email";
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
