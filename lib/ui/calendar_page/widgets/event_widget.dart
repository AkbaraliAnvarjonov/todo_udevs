import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_udevs/data/models/task_model.dart';
import 'package:todo_udevs/ui/details_event_page/details_event_page.dart';
import 'package:todo_udevs/utils/constants/app_icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.eventModel,
  });
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsEventPage(
                eventModel: eventModel,
              ),
            ));
      },
      child: Column(
        children: [
          Container(
            height: 10.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(eventModel.color),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 86.h,
            decoration: BoxDecoration(
                color: Color(eventModel.color).withOpacity(0.18),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                )),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventModel.name,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Color(eventModel.color))),
                  Text(eventModel.description,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                          color: Color(eventModel.color))),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.clockIcon,
                        height: 18.h,
                        width: 18.h,
                        colorFilter: ColorFilter.mode(
                            Color(eventModel.color), BlendMode.srcIn),
                      ),
                      SizedBox(width: 4.w),
                      Text(DateFormat.Hm().format(eventModel.day),
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Color(eventModel.color))),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        AppIcons.locationIcon,
                        height: 18.h,
                        width: 18.h,
                        colorFilter: ColorFilter.mode(
                            Color(eventModel.color), BlendMode.srcIn),
                      ),
                      SizedBox(width: 4.w),
                      Text(eventModel.location,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Color(eventModel.color))),
                    ],
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
