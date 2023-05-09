import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class DetailPageHeader extends StatelessWidget {
  const DetailPageHeader({super.key, required this.user});

  final RandomUser user;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: deviceSize.height * 0.4,
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
                onPressed: () {
                  //share user info
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
