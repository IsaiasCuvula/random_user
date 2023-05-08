import 'package:flutter/material.dart';
import 'package:random_user/presentation/presentation.dart';

class DetailPageBody extends StatelessWidget {
  const DetailPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Isaias Cuvula',
            style: textTheme.headlineLarge,
          ),
          Constants.kVerticalSpaceMedium,
          BodyInfo(
            displayIcon: Icons.location_on_outlined,
            displayTitle: 'Spain, Barcelona',
            displayLabel: 'Barcelona, 9002',
            displayButtonText: 'View on maps',
            onTap: () {},
          ),
          Constants.kVerticalSpaceSmall,
          BodyInfo(
            displayIcon: Icons.email_outlined,
            displayTitle: 'Email',
            displayLabel: 'isaiascuvula@hotmail.com',
            displayButtonText: 'send an email',
            onTap: () {},
          ),
          Constants.kVerticalSpaceSmall,
          BodyInfo(
            displayIcon: Icons.call_rounded,
            displayTitle: 'Phone number',
            displayLabel: '+351 98456318',
            displayButtonText: 'call',
            onTap: () {},
          ),
          Constants.kVerticalSpaceSmall,
          const BodyInfo(
            displayIcon: Icons.location_city_outlined,
            displayTitle: 'Nationality',
            displayLabel: 'Angola',
          ),
          Constants.kVerticalSpaceLarger,
        ],
      ),
    );
  }
}
