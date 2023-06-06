import 'package:flutter/material.dart';
import 'package:random_user/config/config.dart';

class UserIconAction extends StatelessWidget {
  const UserIconAction({
    Key? key,
    required this.displayIcon,
    this.onPressed,
  }) : super(key: key);

  final IconData displayIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        displayIcon,
        color: Colors.green,
        size: Dimessions.kIconSizeSmall,
      ),
    );
  }
}
