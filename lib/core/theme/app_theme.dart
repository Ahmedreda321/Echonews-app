import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import '../utils/app_border_radius.dart';
import '../utils/app_size.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
        primaryColor: AppColor.black,
        scaffoldBackgroundColor: AppColor.primaryColor,
        fontFamily: AppConstants.fontFamily,
        brightness: Brightness.light,
        appBarTheme: _appBarTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
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

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            double.infinity,
            AppSize.elvatedButtonHeight.h,
          ),
          backgroundColor: AppColor.blue,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.smallBorderRadius,
          ),
        ),
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
