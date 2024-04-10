import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_text_styles.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.main,
    primarySwatch: Colors.blue,
    primaryTextTheme: const TextTheme(button: TextStyle(color: Colors.white)),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        shadowColor: AppColors.shadowColor),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.main,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Muli',
    focusColor: AppColors.main,
    inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        fillColor: AppColors.main.withOpacity(0.1),
        hintStyle: AppTextStyle.greyS16,
        focusColor: AppColors.main,
        errorStyle: const TextStyle(color: Colors.red),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 10,
      selectedItemColor: AppColors.main,
      selectedLabelStyle: AppTextStyle.tintS16,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      selectedIconTheme: const IconThemeData(color: AppColors.main, size: 24),
      showUnselectedLabels: true,
      unselectedIconTheme: const IconThemeData(
        color: AppColors.main,
        size: 24,
      ),
      unselectedItemColor: AppColors.main,
      unselectedLabelStyle: AppTextStyle.blackS12,
    ),
  );
}
