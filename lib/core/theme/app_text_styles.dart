import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  // Onboarding Text Styles
  static TextStyle onBordingHead = TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.black,
      letterSpacing: 1.sp,
      overflow: TextOverflow.ellipsis);

  static TextStyle onBordingDesc = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.black,
      letterSpacing: .25.sp,
      overflow: TextOverflow.ellipsis);

  static TextStyle onBordingButton = TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.white,
      letterSpacing: 0.sp,
      overflow: TextOverflow.ellipsis);

  // Auth Text Styles

  static TextStyle hintTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.grayColor,
    letterSpacing: 0.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle authScreenTitle = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.black,
    letterSpacing: 0.25.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle forgotPassword = TextStyle(
    // !! Not used in ForgotPassword only
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
  static TextStyle authButton = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
    letterSpacing: 0.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle authDesc = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.blackOpacity,
    letterSpacing: 0.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle otpField = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
    letterSpacing: 0.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle logo = TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
    letterSpacing: 0.25.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle authFormLabel = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
    overflow: TextOverflow.ellipsis,
  );

  // Home Text Styles

  static TextStyle homeScreenListTile = TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.black,
      letterSpacing: 0.25.sp,
      overflow: TextOverflow.ellipsis,
      height: 2.sp);
  static TextStyle homeScreenSubtitle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.grayColor,
    letterSpacing: 0.25.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle tripCardTitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
    letterSpacing: 0.25.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle appBarSubtitle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.grayColor,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle appBarTitle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle tripCardInfoTitle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.grayColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle tripCardInfoValue = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle tripCardButton = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
    overflow: TextOverflow.ellipsis,
    letterSpacing: 0.25.sp,
  );

  // Notification Text Styles

  static TextStyle notificationBoxTitle = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
    overflow: TextOverflow.ellipsis,
    letterSpacing: 0.25.sp,
  );

  // Profile Text Styles

  static TextStyle profileFormLabel = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.blue,
    letterSpacing: 0.5.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle profileFormText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: AppColor.black,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle screenTitle = TextStyle(
      color: AppColor.black, fontSize: 18.sp, fontWeight: FontWeight.w600);
}
// TODO refactor
