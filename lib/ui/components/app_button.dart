import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';
import 'package:package_name_manager/commons/app_shadow.dart';
import 'package:package_name_manager/ui/widgets/loading_indicator_widget.dart';

class _AppButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onPressed;

  final Color textColor;
  final Color backgroundColor;

  const _AppButton(
      {required this.title,
      required this.isLoading,
      this.onPressed,
      required this.textColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: AppShadow.boxShadow,
      ),
      child: ButtonTheme(
        minWidth: 0.0,
        height: 0.0,
        padding: const EdgeInsets.all(0),
        child: TextButton(
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: onPressed,
          child: _buildBodyWidget(),
        ),
      ),
    );
  }

  Widget _buildBodyWidget() {
    if (isLoading) {
      return const LoadingIndicatorWidget(color: Colors.white);
    } else {
      return Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      );
    }
  }
}

class AppWhiteButton extends _AppButton {
  const AppWhiteButton({
    super.title = '',
    super.isLoading = false,
    super.onPressed,
  }) : super(textColor: AppColors.main, backgroundColor: Colors.white);
}

class AppTintButton extends _AppButton {
  const AppTintButton({
    super.title = '',
    super.isLoading = false,
    super.onPressed,
  }) : super(textColor: Colors.white, backgroundColor: AppColors.main);
}
