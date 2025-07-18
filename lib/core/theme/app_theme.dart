import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.primaryColor,
        fontFamily: AppConstants.fontFamily,
        brightness: Brightness.light,
        appBarTheme: _appBarTheme,
      );



  static ColorScheme get _lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.primaryColor,
        onPrimary: AppColor.grayColor,
        secondary: AppColor.blue,
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

 
  static TextStyle textStyle(double size, FontWeight weight, Color color) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }
}
//TODO refactor
