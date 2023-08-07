import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_udevs/bloc/event_bloc/events_bloc.dart';
import 'package:todo_udevs/data/models/task_model.dart';
import 'package:todo_udevs/ui/details_event_page/widgets/header_widget.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';
import 'package:todo_udevs/utils/constants/app_icons.dart';
import 'package:todo_udevs/utils/constants/form_status.dart';

class DetailsEventPage extends StatelessWidget {
  const DetailsEventPage({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(eventModel: eventModel),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reminder",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "15 minutes befor",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.grey400,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  eventModel.description,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.grey400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          BlocListener<EventsBloc, EventsState>(
            listener: (context, state) {
              if (state.status == FormStatus.deleted) {
                Navigator.pop(context);
              }
            },
            child: Container(
              margin: const EdgeInsets.all(24),
              width: double.infinity,
              height: 46.h,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                onPressed: () {
                  BlocProvider.of<EventsBloc>(context)
                      .add(DeleteEvent(eventModel));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.trashIcon,
                      height: 20.h,
                      width: 20.h,
                      colorFilter: const ColorFilter.mode(
                          AppColors.red, BlendMode.srcIn),
                    ),
                    Text(
                      "Delete Event",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
