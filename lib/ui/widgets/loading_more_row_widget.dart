import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';

class LoadingMoreRowWidget extends StatelessWidget {
  final double height;
  final Color color;

  const LoadingMoreRowWidget(
      {super.key, this.height = 80, this.color = AppColors.main});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            backgroundColor: color,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.gradientStart),
          ),
        ),
      ),
    );
  }
}
