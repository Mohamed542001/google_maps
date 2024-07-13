import '../src/app_export.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Helvetica',
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      surfaceTint: Colors.transparent,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    scaffoldBackgroundColor: AppColors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
    ),
    primaryColor: AppColors.primary,
  );
}
