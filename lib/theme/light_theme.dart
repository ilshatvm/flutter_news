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
      outlinedButtonTheme: _outlinedButtonThemeData,
      iconTheme: const IconThemeData(color: AppColors.greyPrimary),
      searchBarTheme: const SearchBarThemeData(
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            color: AppColors.blackPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        hintStyle: MaterialStatePropertyAll(
          TextStyle(
            color: AppColors.greyPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            height: 2.0,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(AppColors.greyLighter),
        elevation: MaterialStatePropertyAll(0.0),
        padding:
            MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.0)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: AppColors.greyLighter),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: AppColors.greyLighter),
        ),
        filled: true,
        fillColor: AppColors.greyLighter,
        hintStyle: TextStyle(
          color: AppColors.greyPrimary,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        prefixIconColor: AppColors.greyPrimary,
      ),
    );
  }
}

const _outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    minimumSize: MaterialStatePropertyAll(Size.fromHeight(56.0)),
    side: MaterialStatePropertyAll(BorderSide(color: AppColors.greyLighter)),
    textStyle: MaterialStatePropertyAll(
      TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
    ),
  ),
);

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
