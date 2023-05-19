import 'package:dartz/dartz.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/domain/domain.dart';
import 'package:url_launcher/url_launcher.dart';

class MakeCallUseCaseImpl implements MakeCallUseCase {
  @override
  Future<Either<Failure, bool>> execute(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    final canLaunch = await canLaunchUrl(callUri);
    try {
      if (canLaunch) {
        final result = await launchUrl(callUri);
        return Right(result);
      } else {
        return Left(MakingCallFailure());
      }
    } catch (e) {
      return Left(MakingCallFailure());
    }
  }
}
