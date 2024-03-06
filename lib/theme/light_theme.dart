import 'package:flutter/material.dart';
import 'package:flutter_news/theme/theme.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        fontFamily: "SFPro",
        useMaterial3: true,
        colorScheme: _colorSchemeLight,
      );
}

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
