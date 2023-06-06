import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:random_user/config/config.dart';

class DisplayUserImage extends StatelessWidget {
  const DisplayUserImage({
    super.key,
    required this.imageUrl,
    this.radius,
    this.isCircleAvatar = true,
  });

  final String imageUrl;
  final double? radius;
  final bool isCircleAvatar;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          color: Colors.green,
          size: Dimessions.kIconSizeSmall,
        ),
      ),
      imageBuilder: (context, imageProvider) => isCircleAvatar
          ? CircleAvatar(
              maxRadius: radius,
              backgroundImage: imageProvider,
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
