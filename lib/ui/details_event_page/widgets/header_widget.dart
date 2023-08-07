import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_udevs/data/models/task_model.dart';
import 'package:todo_udevs/ui/add_event_page/add_event_page.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';
import 'package:todo_udevs/utils/constants/app_icons.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 248.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(eventModel.color),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundGray,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  splashColor: Colors.transparent, // Remove the splash effect
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    AppIcons.backRow,
                    width: 14.w,
                    height: 14.w,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddEventPage(eventModel: eventModel),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.penIcon,
                        height: 14.h,
                        width: 14.h,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Edit",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.white),
                      )
                    ],
                  ))
            ],
          ),
          const SizedBox(height: 16),
          Text(
            eventModel.name,
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 26.sp,
                color: AppColors.white),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.clockIcon,
                height: 18.h,
                width: 18.h,
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              SizedBox(width: 6.w),
              Text(
                DateFormat.Hm().format(eventModel.day),
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: AppColors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.locationIcon,
                height: 18.h,
                width: 18.h,
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              SizedBox(width: 6.w),
              Text(
                eventModel.location,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: AppColors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
