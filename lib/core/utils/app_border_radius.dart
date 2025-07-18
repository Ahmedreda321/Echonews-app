import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBorderRadius {
  AppBorderRadius._();
  static Radius small = Radius.circular(8.0.r);
  static Radius medium = Radius.circular(12.0.r);
  static Radius large = Radius.circular(16.0.r);
  static Radius extraLarge = Radius.circular(50.r);
  static Radius authContainerRadius = Radius.circular(65.r);
  static double homeProfileIconRadius = 24.r;

  static BorderRadius smallBorder = BorderRadius.all(Radius.circular(8.0.r));
  static BorderRadius mediumBorder = BorderRadius.all(Radius.circular(12.0.r));
  static BorderRadius largeBorder = BorderRadius.all(Radius.circular(16.0.r));
  static BorderRadiusGeometry smallBorderRadius =
      BorderRadius.all(Radius.circular(8.0.r));
  static BorderRadiusGeometry mediumBorderRadius =
      BorderRadius.all(Radius.circular(12.0.r));
  static BorderRadiusGeometry largeBorderRadius =
      BorderRadius.all(Radius.circular(16.0.r));
}
