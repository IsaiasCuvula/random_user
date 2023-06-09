import 'package:flutter/material.dart';
import 'package:random_user/config/config.dart';

class BodyInfo extends StatelessWidget {
  const BodyInfo({
    Key? key,
    required this.displayTitle,
    required this.displayLabel,
    this.displayButtonText,
    required this.displayIcon,
    this.onTap,
  }) : super(key: key);

  final String displayTitle;
  final String displayLabel;
  final String? displayButtonText;
  final VoidCallback? onTap;
  final IconData displayIcon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          displayIcon,
        ),
        Spacing.kHorizontalSpaceSmall,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              displayTitle,
              style: textTheme.headlineMedium,
            ),
            Text(
              displayLabel,
              style: textTheme.bodySmall,
            ),
            if (displayButtonText != null)
              InkWell(
                borderRadius: Dimensions.kBorderSmall,
                onTap: onTap,
                child: Text(
                  displayButtonText.toString(),
                  style: textTheme.headlineSmall?.copyWith(
                    color: Colors.blue,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
