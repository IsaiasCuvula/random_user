import 'package:flutter/material.dart';

class Constants {
  static const String apiUrl = 'https://randomuser.me/api';

  //Dimensions
  static const EdgeInsets kMarginLarge = EdgeInsets.all(20.0);
  static const EdgeInsets kPaddingBottomRight = EdgeInsets.only(
    bottom: 20.0,
    right: 10.0,
  );
  static final BorderRadius kBorderSmall = BorderRadius.circular(10.0);
  static const double kIconSizeSmall = 40;

  //Space
  static const kVerticalSpaceLarger = SizedBox(height: 100.0);
  static const kVerticalSpaceLarge = SizedBox(height: 80.0);
  static const kVerticalSpaceMedium = SizedBox(height: 50.0);
  static const kVerticalSpaceSmall = SizedBox(height: 20.0);
  static const kVerticalSpaceSmaller = SizedBox(height: 10.0);

  static const kHorizontalSpaceLarge = SizedBox(width: 20.0);
  static const kHorizontalSpaceMedium = SizedBox(width: 16.0);
  static const kHorizontalSpaceSmall = SizedBox(width: 10.0);
}
