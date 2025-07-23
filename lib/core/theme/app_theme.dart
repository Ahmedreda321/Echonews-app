import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.primaryColor,
        fontFamily: AppConstants.fontFamily,
        brightness: Brightness.light,
        appBarTheme: _appBarTheme,
        elevatedButtonTheme: _appElevatedButtonTheme,
      );

  static ColorScheme get _lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.primaryColor,
        onPrimary: AppColor.grayColor,
        secondary: AppColor.secondaryColor,
        onSecondary: AppColor.white,
        error: AppColor.errorColor,
        onError: AppColor.white,
        surface: AppColor.backgroundColor,
        onSurface: AppColor.black,
      );

  static AppBarTheme get _appBarTheme => const AppBarTheme(
        backgroundColor: AppColor.primaryColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.black),
      );

  static ElevatedButtonThemeData get _appElevatedButtonTheme =>
      ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            const WidgetStatePropertyAll<Color>(AppColor.secondaryColor),
        foregroundColor: const WidgetStatePropertyAll<Color>(AppColor.black),
        textStyle:
            WidgetStatePropertyAll<TextStyle>(AppTextStyles.elevatedButton),
      ));

  static TextStyle textStyle(double size, FontWeight weight, Color color) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }
}
