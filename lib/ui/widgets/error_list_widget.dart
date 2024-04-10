import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_text_styles.dart';

class ErrorListWidget extends StatelessWidget {
  final String text;
  final RefreshCallback onRefresh;

  const ErrorListWidget(
      {super.key, this.text = 'Đã xảy ra lỗi', required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  text,
                  style: AppTextStyle.greyS18W800,
                ),
              ),
            );
          },
          itemCount: 1,
        ));
  }
}
