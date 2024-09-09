import 'package:flare/core/configs/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.dark,
      fontFamily: 'CircularStd',
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.background,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      textTheme: AppTextTheme.lightTextTheme,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.secondBackground,
          hintStyle: const TextStyle(
            color: Color(0xffA7A7A7),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))));
  static final darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      
      dropdownMenuTheme: const DropdownMenuThemeData(
      
        menuStyle: MenuStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          surfaceTintColor: WidgetStatePropertyAll(AppColors.secondBackground),
          minimumSize: WidgetStatePropertyAll(Size.fromWidth(double.infinity)),
          backgroundColor: WidgetStatePropertyAll(AppColors.secondBackground),
      
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(55)),
              side: BorderSide(color: AppColors.secondBackground, width: 1.5))),
        ),
      ),
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.dark,
      fontFamily: 'CircularStd',
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.background,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      textTheme: AppTextTheme.dartTextTheme,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.secondBackground,
          hintStyle: const TextStyle(
            color: Color(0xffA7A7A7),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))));
}
