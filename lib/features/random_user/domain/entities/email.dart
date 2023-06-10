import 'package:equatable/equatable.dart';
import 'package:random_user/features/random_user/random_user.dart';

class Email extends Equatable {
  final String recipient;
  final String subject;
  final String body;

  const Email({
    required this.recipient,
    required this.subject,
    required this.body,
  });

  factory Email.fromUser(User user) {
    final String name = '${user.name?.first} ${user.name?.first}';
    final address = '${user.location?.country} ${user.location?.state}';
    final String body = '$name \n $address';

    return Email(
      recipient: user.email.toString(),
      subject: 'User: ${user.name?.first} Info',
      body: body,
    );
  }

  @override
  List<Object?> get props => [recipient, subject, body];
}
