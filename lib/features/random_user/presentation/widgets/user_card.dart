import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/config.dart';
import 'package:random_user/features/random_user/random_user.dart';

class UserCard extends ConsumerWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);
  final RandomUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;
    final displayInfo = ref.watch(displayInfoProvider);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: deviceSize.height * 0.15,
          width: deviceSize.width,
          color: Colors.green,
        ),
        Container(
          margin: Dimensions.kMarginLarge,
          height: deviceSize.height * 0.3,
          width: deviceSize.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: Dimensions.kBorderSmall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: DisplayUserImage(
                  radius: 50.0,
                  imageUrl: '${user.picture?.medium}',
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  displayInfo,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.info_outline_rounded,
                        onPressed: () {
                          context.pushNamed(
                            RoutesName.userDetail,
                            extra: user,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.email_outlined,
                        onPressed: () {
                          ref
                              .read(displayInfoProvider.notifier)
                              .updateInfo(user.email);
                        },
                      ),
                    ),
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.person_outline,
                        onPressed: () {
                          final username =
                              '${user.name?.title} ${user.name?.first} ${user.name?.last}';
                          ref
                              .read(displayInfoProvider.notifier)
                              .updateInfo(username);
                        },
                      ),
                    ),
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.location_on_outlined,
                        onPressed: () {
                          final address =
                              '${user.location?.country}, ${user.location?.city}';
                          ref
                              .read(displayInfoProvider.notifier)
                              .updateInfo(address);
                        },
                      ),
                    ),
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.call_outlined,
                        onPressed: () {
                          ref
                              .read(displayInfoProvider.notifier)
                              .updateInfo(user.phone);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
