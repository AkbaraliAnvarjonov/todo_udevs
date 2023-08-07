import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:todo_udevs/data/models/task_model.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';
import 'package:todo_udevs/utils/constants/app_icons.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  // final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 10.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ))),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: 86.h,
          decoration: BoxDecoration(
              color: AppColors.blue.withOpacity(0.18),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              )),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Watching Football",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: AppColors.blue)),
                Text("Manchester United vs Arsenal (Premiere League)",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 8.sp,
                        color: AppColors.blue)),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.clockIcon,
                      height: 18.h,
                      width: 18.h,
                      color: AppColors.blue,
                    ),
                    SizedBox(width: 4.w),
                    Text("19:00 - 18:30",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: AppColors.blue)),
                    const SizedBox(width: 20),
                    SvgPicture.asset(
                      AppIcons.locationIcon,
                      height: 18.h,
                      width: 18.h,
                      color: AppColors.blue,
                    ),
                    SizedBox(width: 4.w),
                    Text("Location",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: AppColors.blue)),
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
