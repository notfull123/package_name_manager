import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';
import 'package:package_name_manager/commons/app_dimens.dart';
import 'package:package_name_manager/commons/app_images.dart';
import 'package:package_name_manager/commons/app_text_styles.dart';

class AppBarWidget extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final String? title;

  const AppBarWidget({super.key, this.onBackPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.appBarHeight,
      decoration: const BoxDecoration(
        color: AppColors.main,
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          GestureDetector(
            onTap: onBackPressed,
            child: onBackPressed != null
                ? SizedBox(
                    width: 44,
                    height: 44,
                    child: Image.asset(AppImages.icWhiteBack),
                  )
                : const SizedBox(width: 6),
          ),
          const SizedBox(width: 2),
          Text(
            title ?? "",
            style: AppTextStyle.whiteS18W800,
          )
        ],
      ),
    );
  }
}
