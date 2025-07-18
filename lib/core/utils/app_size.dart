import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  //
  AppSize._();
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double large = 16.0;
  static const double average = 20.0;
  static const double extraLarge = 24.0;
  static double extraExtraLarge = 32.0.w;
  static double profileImageheight = 150.h;
  static double profileImageRadius = 75.r;
  static const int onBoardingIconSize = 177;
  static const double elvatedButtonHeight = 40.0;
  static double homeTribCardHeight = 170.0.h;
  static double notificationCardHeight = 300.h;
  static double notificationHeight = 84.h;
  static double notificationCardWidth = 328.w;
  static double notificationIconSize = 30.sp;

  static Size authButtonSize =
      Size(double.infinity, 57.h); //! not ACCURATE Name

  static const Size designSize =  Size(360, 800);
  static Size homeAppBarSize = Size.fromHeight(100.0.h);
  static Size editProfileSize = Size(150.w, 40.h);
  static Size homeCardButtonSize = Size(double.infinity, 40.h);
  static double homeAppBarHeight = 100.0.h;
  static double homeAppBarNotificationSize = 35.0.h;
}
//TODO refactor
