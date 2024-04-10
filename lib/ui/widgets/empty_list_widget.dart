import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_text_styles.dart';

class EmptyListWidget extends StatelessWidget {
  final String text;
  final RefreshCallback onRefresh;

  const EmptyListWidget(
      {super.key, this.text = 'Không có data', required this.onRefresh});

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
