import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({
    super.key,
    required this.onTap,
    required this.assetName,
  });
  final VoidCallback onTap;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.w,
      decoration: const BoxDecoration(
        color: AppColors.backgroundGray,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashColor: Colors.transparent, // Remove the splash effect
        highlightColor: Colors.transparent,
        onPressed: onTap,
        icon: SvgPicture.asset(
          assetName,
          width: 15.w,
          height: 15.w,
        ),
      ),
    );
  }
}
