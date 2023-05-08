import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/presentation/presentation.dart';

class DetailPageHeader extends StatelessWidget {
  const DetailPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: deviceSize.height * 0.4,
          color: Colors.green.shade100,
        ),
        Padding(
          padding: Constants.kPaddingBottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserIconAction(
                displayIcon: Icons.arrow_back,
                onPressed: () => context.pop(),
              ),
              UserIconAction(
                displayIcon: Icons.share,
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
