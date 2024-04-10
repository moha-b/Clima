part of 'utils.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    useMaterial3: true,
    fontFamily: 'manrope',
    focusColor: AppColors.dayPrimary,
    cardColor: AppColors.dayBorderPrimary,
    brightness: Brightness.light,
    bottomNavigationBarTheme: BottomNavigationBarThemes.light,
    appBarTheme: AppBarThemes.basic,
  );
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    primaryColor: AppColors.white,
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: 'manrope',
    cardColor: AppColors.nightBorderPrimary,
    focusColor: AppColors.nightPrimary,
    bottomNavigationBarTheme: BottomNavigationBarThemes.dark,
    appBarTheme: AppBarThemes.basic,
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

class AppBarThemes {
  static AppBarTheme basic = const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
