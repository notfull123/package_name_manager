import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';

class AppGradient {
  static const linearGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [AppColors.gradientStart, AppColors.gradientEnd], //Flutter bug
  );
}
