import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_udevs/ui/calendar_page/widgets/calendar_widget.dart';
import 'package:todo_udevs/utils/constants/app_icons.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backGroundWhite,
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "Dushanba",
            ),
            Text("28 september 2023")
          ],
        ),
        actions: [
          SvgPicture.asset(
            AppIcons.notification,
            width: 28.w,
            height: 28.h,
          )
        ],
      ),
      body: const Column(
        children: [CalendarWidget()],
      ),
    );
  }
}
