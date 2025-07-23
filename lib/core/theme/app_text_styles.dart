import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_constants.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  // elvatedButton
  static final TextStyle elevatedButton = TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.black,
  );
  // AppBar
  static final TextStyle appBar = TextStyle(
      fontFamily: AppConstants.appBarFontFamily,
      fontSize: 30.sp,
      color: AppColor.black,
      fontWeight: FontWeight.w500);
  // Category
  static final TextStyle category = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColor.black);

  // News
  // Title
  static final TextStyle newsTitle = TextStyle(
      height: 1,
      fontFamily: AppConstants.newsTitleFontFamily,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
      fontSize: 26.sp);
  // Description
  static final TextStyle newsDescription =
      TextStyle(fontSize: 19.sp, color: AppColor.newsDescriptionColor);
}
