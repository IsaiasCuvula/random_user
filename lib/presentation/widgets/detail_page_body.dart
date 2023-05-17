import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class DetailPageBody extends ConsumerWidget {
  const DetailPageBody({super.key, required this.user});
  final RandomUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.kVerticalSpaceSmall,
          FittedBox(
            fit: BoxFit.fitWidth,
            child: DisplayUserName(
              user: user,
              style: textTheme.headlineLarge,
            ),
          ),
          Constants.kVerticalSpaceSmall,
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
          Constants.kVerticalSpaceSmall,
          FittedBox(
            fit: BoxFit.fitWidth,
            child: BodyInfo(
              displayIcon: Icons.call_rounded,
              displayTitle: 'Phone number',
              displayLabel: '${user.phone}',
              displayButtonText: 'call',
              onTap: () async {
                final phoneNumber = '${user.phone}';
                await ref.read(makeCallProvider).makeCall(phoneNumber);
              },
            ),
          ),
          Constants.kVerticalSpaceSmall,
          FittedBox(
            fit: BoxFit.fitWidth,
            child: BodyInfo(
              displayIcon: Icons.location_city_outlined,
              displayTitle: 'Nationality',
              displayLabel: '${user.nat} - ${user.location?.country}',
            ),
          ),
          Constants.kVerticalSpaceSmall,
          FittedBox(
            fit: BoxFit.fitWidth,
            child: BodyInfo(
              displayIcon: Icons.location_on_outlined,
              displayTitle:
                  '${user.location?.country} , ${user.location?.city}',
              displayLabel:
                  '${user.location?.state} , ${user.location?.postcode}',
            ),
          ),
          Constants.kVerticalSpaceLarger,
        ],
      ),
    );
  }
}
