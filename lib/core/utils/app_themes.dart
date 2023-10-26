import 'package:clima/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    useMaterial3: true,
    focusColor: AppColors.dayPrimary,
    brightness: Brightness.light,
    bottomNavigationBarTheme: BottomNavigationBarThemes.light,
  );
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    primaryColor: AppColors.white,
    brightness: Brightness.dark,
    useMaterial3: true,
    focusColor: AppColors.nightPrimary,
    bottomNavigationBarTheme: BottomNavigationBarThemes.dark,
  );
  static ThemeData basic = ThemeData(
    scaffoldBackgroundColor: AppColors.basic,
    primaryColor: AppColors.white,
    useMaterial3: true,
    brightness: Brightness.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemes.dark,
  );
}

class BottomNavigationBarThemes {
  static BottomNavigationBarThemeData light =
      const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
    selectedItemColor: AppColors.black,
  );
  static BottomNavigationBarThemeData dark = const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.secondary,
  );
}
