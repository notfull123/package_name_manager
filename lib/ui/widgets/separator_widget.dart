import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';

class SeparatorWidget extends StatelessWidget {
  final EdgeInsets margin;
  final double height;
  final double width;

  const SeparatorWidget({
    super.key,
    this.margin = EdgeInsets.zero,
    this.height = 1,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      color: AppColors.lightGray,
    );
  }
}
