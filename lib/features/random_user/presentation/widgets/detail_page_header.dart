import 'package:flutter/material.dart';
import 'package:random_user/features/random_user/random_user.dart';

class DetailPageHeader extends StatelessWidget {
  const DetailPageHeader({super.key, required this.user});

  final RandomUser user;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.5,
      width: deviceSize.width,
      color: Colors.green.shade100,
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: DisplayUserImage(
          imageUrl: '${user.picture?.large}',
          isCircleAvatar: false,
        ),
      ),
    );
  }
}
