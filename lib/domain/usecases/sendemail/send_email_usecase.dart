import 'package:random_user/domain/domain.dart';

abstract class SendEmailUseCase {
  Future<void> call(Email email);
}
