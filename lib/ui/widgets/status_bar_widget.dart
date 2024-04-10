import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';
import 'package:package_name_manager/commons/screen_size.dart';

class StatusBarWidget extends StatelessWidget {
  final Color color;

  const StatusBarWidget({super.key, this.color = AppColors.main});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.of(context).topPadding,
      color: color ?? AppColors.main,
    );
  }
}
