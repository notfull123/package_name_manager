import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final Color color;

  const LoadingIndicatorWidget({super.key, this.color = AppColors.main});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          backgroundColor: color,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.gradientStart),
        ),
      ),
    );
  }
}
