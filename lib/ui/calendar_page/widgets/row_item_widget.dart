import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';
import 'package:todo_udevs/utils/tools/date_time_extension.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
  });

  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;

  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    final bool isPassed = date.isBefore(DateTime.now());

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        alignment: Alignment.center,
        height: 30.h,
        width: 30.h,
        decoration: isSelected
            ? const BoxDecoration(color: AppColors.blue, shape: BoxShape.circle)
            : isToday
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.blue,
                    ),
                  )
                : null,
        child: Text(
          number.toString(),
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.white
                  : isPassed
                      ? isActiveMonth
                          ? Colors.grey
                          : Colors.transparent
                      : isActiveMonth
                          ? Colors.black
                          : Colors.grey[300]),
        ),
      ),
    );
  }
}
