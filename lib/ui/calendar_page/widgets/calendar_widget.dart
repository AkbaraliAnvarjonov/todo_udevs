import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_udevs/ui/calendar_page/widgets/calendar_body.dart';
import 'package:todo_udevs/ui/calendar_page/widgets/calendar_header.dart';
import 'package:todo_udevs/utils/tools/date_time_extension.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime selectedMonth;

  DateTime? selectedDate;

  @override
  void initState() {
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 320.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(
              selectedMonth: selectedMonth,
              selectedDate: selectedDate,
              onChange: (value) => setState(() => selectedMonth = value),
            ),
            Expanded(
              child: Body(
                selectedDate: selectedDate,
                selectedMonth: selectedMonth,
                selectDate: (DateTime value) => setState(() {
                  selectedDate = value;
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
