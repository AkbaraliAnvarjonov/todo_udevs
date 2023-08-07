import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: AppColors.grey900),
    );
  }
}
