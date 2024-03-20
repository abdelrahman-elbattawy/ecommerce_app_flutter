import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/functions/bulid_material_color_func.dart';
import 'package:flutter/material.dart';

final class AppThemeData {
  static final themeEnglish = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBackgroundColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
    primarySwatch: buildMaterialColor(AppColors.primaryColor),
  );

  static final themeArabic = ThemeData(
    fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBackgroundColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
    primarySwatch: buildMaterialColor(AppColors.primaryColor),
  );
}
