import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(height: height.h);
SizedBox horizontalSpace(double width) => SizedBox(width: width.w);
MediaQueryData getMediaQuery(BuildContext context) => MediaQuery.of(context);
double getScreenWidth(BuildContext context) =>
    getMediaQuery(context).size.width;
double getScreenHeight(BuildContext context) =>
    getMediaQuery(context).size.height;
