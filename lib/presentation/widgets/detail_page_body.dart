import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/config/config.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class DetailPageBody extends ConsumerWidget {
  const DetailPageBody({super.key, required this.user});
  final RandomUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final sendEmailState = ref.watch(sendEmailProvider);
    final makeCallState = ref.watch(makeCallProvider);
    final sendEmailErrorMessage = sendEmailState.erroMessage;
    final makeCallErrorMessage = makeCallState.erroMessage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.kVerticalSpaceSmall,
        FittedBox(
          fit: BoxFit.fitWidth,
          child: DisplayUserName(
            user: user,
            style: textTheme.headlineLarge,
          ),
        ),
        Spacing.kVerticalSpaceSmall,
        FittedBox(
          fit: BoxFit.fitWidth,
          child: BodyInfo(
            displayIcon: Icons.email_outlined,
            displayTitle: 'Email',
            displayLabel: '${user.email}',
            displayButtonText: 'send an email',
            onTap: () async {
              await ref.read(sendEmailProvider.notifier).sendEmail(
                    Email.fromUser(user),
                  );
            },
          ),
        ),
        Spacing.kVerticalSpaceSmall,
        if (sendEmailErrorMessage != null)
          DisplayMessage(
            message: sendEmailErrorMessage,
          ),
        Spacing.kVerticalSpaceSmall,
        FittedBox(
          fit: BoxFit.fitWidth,
          child: BodyInfo(
            displayIcon: Icons.call_rounded,
            displayTitle: 'Phone number',
            displayLabel: '${user.phone}',
            displayButtonText: 'call',
            onTap: () async {
              final phoneNumber = '${user.phone}';
              await ref.read(makeCallProvider.notifier).makeCall(phoneNumber);
            },
          ),
        ),
        Spacing.kVerticalSpaceSmall,
        if (makeCallErrorMessage != null)
          DisplayMessage(
            message: makeCallErrorMessage,
          ),
        Spacing.kVerticalSpaceSmall,
        FittedBox(
          fit: BoxFit.fitWidth,
          child: BodyInfo(
            displayIcon: Icons.location_city_outlined,
            displayTitle: 'Nationality',
            displayLabel: '${user.nat} - ${user.location?.country}',
          ),
        ),
        Spacing.kVerticalSpaceSmall,
        FittedBox(
          fit: BoxFit.fitWidth,
          child: BodyInfo(
            displayIcon: Icons.location_on_outlined,
            displayTitle: '${user.location?.country} , ${user.location?.city}',
            displayLabel:
                '${user.location?.state} , ${user.location?.postcode}',
          ),
        ),
        Spacing.kVerticalSpaceLarger,
      ],
    );
  }
}
