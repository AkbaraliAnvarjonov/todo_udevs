import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';

class AppTextStyles {
  static TextStyle headlineLarge = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 26.sp,
      color: AppColors.textColor);
  static TextStyle headlineMedium = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColors.textColor);
  static TextStyle headlineMediumBold = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      color: AppColors.textColor);
  static TextStyle headlineSmall = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
      color: AppColors.textColor);
}
