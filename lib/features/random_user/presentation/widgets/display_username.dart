import 'package:flutter/material.dart';
import 'package:random_user/features/random_user/random_user.dart';

class DisplayUserName extends StatelessWidget {
  const DisplayUserName({
    super.key,
    required this.user,
    this.style,
  });

  final RandomUser user;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${user.name?.title} ${user.name?.first} ${user.name?.last}',
      style: style,
    );
  }
}
