import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';

class AppTextStyles {
  static TextStyle headlineLarge(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
          fontFamily: "Poppins",
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: fontSize ?? 23.sp,
          color: color ?? AppColors.textColor);
  static TextStyle headlineMedium(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
          fontFamily: "Poppins",
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: fontSize ?? 14.sp,
          color: color ?? AppColors.textColor);
  static TextStyle headlineMediumBold(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
          fontFamily: "Poppins",
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: fontSize ?? 12.sp,
          color: color ?? AppColors.textColor);
  static TextStyle headlineSmall(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
          fontFamily: "Poppins",
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: fontSize ?? 10.sp,
          color: color ?? AppColors.textColor);
}
