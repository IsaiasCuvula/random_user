import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/config.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);
  final RandomUser user;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: deviceSize.height * 0.15,
          width: deviceSize.width,
          color: Colors.green,
        ),
        Container(
          margin: Constants.kMarginLarge,
          height: deviceSize.height * 0.3,
          width: deviceSize.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: Constants.kBorderSmall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.green,
                  onBackgroundImageError: (exception, stackTrace) {
                    return;
                  },
                  backgroundImage: NetworkImage(
                    '${user.picture?.medium}',
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  '${user.name?.title} ${user.name?.first} ${user.name?.last}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.person_pin,
                        onPressed: () {
                          context.pushNamed(
                            RoutesName.userDetail,
                            extra: user,
                          );
                          //to be definid what to do, maybe share te user info
                        },
                      ),
                    ),
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.email_outlined,
                        onPressed: () {
                          //email the user
                        },
                      ),
                    ),
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.today_rounded,
                        onPressed: () {
                          //open the calendar and book something
                        },
                      ),
                    ),
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.map_outlined,
                        onPressed: () {
                          //make call
                        },
                      ),
                    ),
                    Expanded(
                      child: UserIconAction(
                        displayIcon: Icons.call_rounded,
                        onPressed: () {
                          //make call
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
