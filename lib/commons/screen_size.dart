import 'package:flutter/material.dart';

class ScreenSize {
  double? width;
  double? height;
  double? topPadding;
  double? bottomPadding;

  ScreenSize.of(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
    topPadding = mediaQueryData.padding.top;
    bottomPadding = mediaQueryData.padding.bottom;
  }
}
