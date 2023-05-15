import 'package:flutter/material.dart';

class DisplayUserImage extends StatelessWidget {
  const DisplayUserImage({
    super.key,
    required this.imageUrl,
    required this.radius,
  });

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: radius,
      backgroundColor: Colors.white,
      onBackgroundImageError: (exception, stackTrace) {
        return;
      },
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
