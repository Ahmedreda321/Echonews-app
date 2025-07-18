import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMargin {
  //
  AppMargin._();
  static EdgeInsetsGeometry smallSymmetric =
      EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 4.0.w);
  static EdgeInsetsGeometry onlyRightSmall = EdgeInsets.only(right: 4.0.w);
  static EdgeInsetsGeometry onlyBottomSmall = EdgeInsets.only(bottom: 6.0.w);
  static EdgeInsetsGeometry small = EdgeInsets.all(8.0.w);
  static EdgeInsetsGeometry medium = EdgeInsets.all(12.0.w);
  static EdgeInsetsGeometry large = EdgeInsets.all(16.0.w);
  static EdgeInsetsGeometry profileBackIcon =
      EdgeInsets.only(left: 10.w, top: 10.h, bottom: 5.h);
}
