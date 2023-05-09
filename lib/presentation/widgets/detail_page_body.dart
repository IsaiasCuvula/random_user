import 'package:flutter/material.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class DetailPageBody extends StatelessWidget {
  const DetailPageBody({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              '${user.name?.title} ${user.name?.first} ${user.name?.last}',
              style: textTheme.headlineLarge,
            ),
          ),
          Constants.kVerticalSpaceMedium,
          FittedBox(
            fit: BoxFit.fitWidth,
            child: BodyInfo(
              displayIcon: Icons.location_on_outlined,
              displayTitle:
                  '${user.location?.country} , ${user.location?.city}',
              displayLabel:
                  '${user.location?.state} , ${user.location?.postcode}',
              displayButtonText: 'View on maps',
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
          Constants.kVerticalSpaceLarger,
        ],
      ),
    );
  }
}
