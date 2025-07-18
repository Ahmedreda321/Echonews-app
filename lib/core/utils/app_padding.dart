import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  //
  AppPadding._();
  static EdgeInsetsGeometry extraSmall = EdgeInsets.all(4.0.w);
  static EdgeInsetsGeometry small = EdgeInsets.all(8.0.w);
  static EdgeInsetsGeometry medium = EdgeInsets.all(12.0.w);
  static EdgeInsetsGeometry large = EdgeInsets.all(16.0.w);
  static EdgeInsetsGeometry textFormFild =
      EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w);
  static EdgeInsetsGeometry profileFormPadding =
      EdgeInsets.symmetric(vertical: 18.h);
  static EdgeInsetsGeometry profileFormLabelPadding = EdgeInsets.only(
    top: 12.h,
  );
}
