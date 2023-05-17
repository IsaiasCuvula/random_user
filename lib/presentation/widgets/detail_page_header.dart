import 'package:flutter/material.dart';
import 'package:random_user/domain/domain.dart';

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
        child: Image.network(
          '${user.picture?.large}',
          fit: BoxFit.cover,
          loadingBuilder: (ctx, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
