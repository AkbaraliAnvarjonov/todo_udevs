import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_udevs/ui/calendar_page/widgets/calendar_button.dart';
import 'package:todo_udevs/ui/calendar_page/widgets/row_item_widget.dart';
import 'package:todo_udevs/utils/constants/app_icons.dart';
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
      child: Container(
        height: 350.h,
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Header(
              selectedMonth: selectedMonth,
              selectedDate: selectedDate,
              onChange: (value) => setState(() => selectedMonth = value),
            ),
            Expanded(
              child: _Body(
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

class _Body extends StatelessWidget {
  const _Body({
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Mon'),
            Text('Tue'),
            Text('Wed'),
            Text('Thu'),
            Text('Fri'),
            Text('Sat'),
            Text('Sun'),
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
                      hasRightBorder: false,
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
}

class _Header extends StatelessWidget {
  const _Header({
    required this.selectedMonth,
    required this.selectedDate,
    required this.onChange,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
              'Selected date: ${selectedDate == null ? 'non' : "${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}"}'),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Month: ${selectedMonth.month + 1}/${selectedMonth.year}',
                  textAlign: TextAlign.center,
                ),
              ),
              CalendarButton(
                  onTap: () {
                    onChange(selectedMonth.addMonth(-1));
                  },
                  assetName: AppIcons.backRow),
              CalendarButton(
                  onTap: () {
                    onChange(selectedMonth.addMonth(1));
                  },
                  assetName: AppIcons.nextRow),
            ],
          ),
        ],
      ),
    );
  }
}

class CalendarMonthData {
  final int year;
  final int month;

  int get daysInMonth => DateUtils.getDaysInMonth(year, month);
  int get firstDayOfWeekIndex => 0;

  int get weeksCount => ((daysInMonth + firstDayOffset) / 7).ceil();

  const CalendarMonthData({
    required this.year,
    required this.month,
  });

  int get firstDayOffset {
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;

    return (weekdayFromMonday - ((firstDayOfWeekIndex - 1) % 7)) % 7 - 1;
  }

  List<List<CalendarDayData>> get weeks {
    final res = <List<CalendarDayData>>[];
    var firstDayMonth = DateTime(year, month, 1);
    var firstDayOfWeek = firstDayMonth.subtract(Duration(days: firstDayOffset));

    for (var w = 0; w < weeksCount; w++) {
      final week = List<CalendarDayData>.generate(
        7,
        (index) {
          final date = firstDayOfWeek.add(Duration(days: index));

          final isActiveMonth = date.year == year && date.month == month;

          return CalendarDayData(
            date: date,
            isActiveMonth: isActiveMonth,
            isActiveDate: date.isToday,
          );
        },
      );
      res.add(week);
      firstDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));
    }
    return res;
  }
}

class CalendarDayData {
  final DateTime date;
  final bool isActiveMonth;
  final bool isActiveDate;

  const CalendarDayData({
    required this.date,
    required this.isActiveMonth,
    required this.isActiveDate,
  });
}
