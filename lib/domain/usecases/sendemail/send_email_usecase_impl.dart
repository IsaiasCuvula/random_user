import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/domain/domain.dart';
import 'package:url_launcher/url_launcher.dart';

class SendEmailUseCaseImpl implements SendEmailUseCase {
  @override
  Future<Either<Failure, bool>> call(Email email) async {
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
        final reuslt = await launchUrl(emailUrl);
        return Right(reuslt);
      } else {
        return Left(SendingEmailFailure());
      }
    } catch (_) {
      return Left(SendingEmailFailure());
    }
  }
}
