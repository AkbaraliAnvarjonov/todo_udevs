import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_udevs/data/models/calendar_data.dart';
import 'package:todo_udevs/ui/calendar_page/widgets/row_item_widget.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';
import 'package:todo_udevs/utils/tools/date_time_extension.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectDate,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> selectDate;

  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            weekDay('Mon'),
            weekDay('Tue'),
            weekDay('Wed'),
            weekDay('Thu'),
            weekDay('Fri'),
            weekDay('Sat'),
            weekDay('Sun'),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var week in data.weeks)
              Row(
                children: week.map((d) {
                  return Expanded(
                    child: RowItem(
                      date: d.date,
                      isActiveMonth: d.isActiveMonth,
                      onTap: () => selectDate(d.date),
                      isSelected: selectedDate != null &&
                          selectedDate!.isSameDate(d.date),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }

  Text weekDay(String day) {
    return Text(
      day,
      style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: AppColors.textColorGrey),
    );
  }
}
