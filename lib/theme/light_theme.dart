import 'package:flutter/material.dart';
import 'package:flutter_news/theme/theme.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "SFPro",
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.blackPrimary),
        bodyMedium: TextStyle(color: AppColors.blackPrimary),
        bodySmall: TextStyle(color: AppColors.blackPrimary),
        titleLarge: TextStyle(color: AppColors.blackPrimary),
        titleMedium: TextStyle(color: AppColors.blackPrimary),
        titleSmall: TextStyle(color: AppColors.blackPrimary),
        labelLarge: TextStyle(color: AppColors.blackPrimary),
        labelMedium: TextStyle(color: AppColors.blackPrimary),
        labelSmall: TextStyle(color: AppColors.blackPrimary),
        displayLarge: TextStyle(color: AppColors.blackPrimary),
        displayMedium: TextStyle(color: AppColors.blackPrimary),
        displaySmall: TextStyle(color: AppColors.blackPrimary),
        headlineLarge: TextStyle(color: AppColors.blackPrimary),
        headlineMedium: TextStyle(color: AppColors.blackPrimary),
        headlineSmall: TextStyle(color: AppColors.blackPrimary),
      ),
      useMaterial3: true,
      colorScheme: _colorSchemeLight,
      filledButtonTheme: _filledButtonThemeData,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    );
  }
}

const FilledButtonThemeData _filledButtonThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    minimumSize: MaterialStatePropertyAll(Size.fromHeight(56.0)),
    textStyle: MaterialStatePropertyAll(
      TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
    ),
  ),
);

const ColorScheme _colorSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.purplePrimary,
  onPrimary: Colors.white,
  secondary: AppColors.purplePrimary,
  onSecondary: Colors.white,
  error: AppColors.purplePrimary,
  onError: AppColors.purplePrimary,
  background: Colors.white,
  onBackground: AppColors.purplePrimary,
  surface: Colors.white,
  onSurface: AppColors.purplePrimary,
  surfaceVariant: AppColors.greyLighter,
  surfaceTint: Colors.transparent,
);
