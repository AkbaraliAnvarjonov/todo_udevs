import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_udevs/ui/add_event_page/add_event_page.dart';
import 'package:todo_udevs/ui/calendar_page/widgets/calendar_widget.dart';
import 'package:todo_udevs/ui/calendar_page/widgets/event_widget.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';
import 'package:todo_udevs/utils/constants/app_icons.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backGroundWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text("Dushanba",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.textColor)),
            Text(
              "28 september 2023",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColors.textColor),
            )
          ],
        ),
        actions: [
          SvgPicture.asset(
            AppIcons.notification,
            width: 28.w,
            height: 28.h,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const CalendarWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Schedule",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: AppColors.textColor)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AddEventPage(),
                        ));
                  },
                  child: Container(
                    height: 30.h,
                    width: 102.w,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text("+ Add Event",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                              color: AppColors.white)),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return const EventWidget();
              },
            )
          ],
        ),
      ),
    );
  }
}
