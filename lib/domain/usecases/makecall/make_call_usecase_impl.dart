import 'package:random_user/domain/domain.dart';
import 'package:url_launcher/url_launcher.dart';

class MakeCallUseCaseImpl implements MakeCallUseCase {
  @override
  Future<void> execute(String phoneNumber) async {
    final Uri callUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    final canLaunch = await canLaunchUrl(callUri);
    try {
      if (canLaunch) {
        await launchUrl(callUri);
      }
    } catch (e) {
      rethrow;
    }
  }
}
