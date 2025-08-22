import 'package:flutter/material.dart';
import 'package:ensan_app/core/style/fonts/app_font_handler.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundPrimary,
      primaryColor: AppColors.primary,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: AppColors.textAndIconPrimary),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontFamily: AppFontHandler.getLocalizedFontFamily(),
          color: AppColors.textAndIconPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFontHandler.getLocalizedFontFamily(),
          color: AppColors.textAndIconSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontFamily: AppFontHandler.getLocalizedFontFamily(),
          color: AppColors.textAndIconThritly,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
          height: 1.3,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundSecondary,
        iconTheme: IconThemeData(color: AppColors.textAndIconPrimary),
        titleTextStyle: TextStyle(
          fontFamily: AppFontHandler.getLocalizedFontFamily(),
          color: AppColors.textAndIconPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textAndIconPrimary,
      ),
    );
  }
}
