import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_udevs/ui/add_event_page/widgets/form_field_widget.dart';
import 'package:todo_udevs/ui/add_event_page/widgets/text_widget.dart';
import 'package:todo_udevs/utils/constants/app_colors.dart';
import 'package:todo_udevs/utils/constants/app_icons.dart';

// ignore: must_be_immutable
class AddEventPage extends StatelessWidget {
  AddEventPage({super.key});
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(txt: "Event Name"),
            FormFieldWidget(
              numberLine: 1,
              controller: controllerName,
              isLocation: false,
            ),
            const TextWidget(txt: "Event description"),
            FormFieldWidget(
              numberLine: 5,
              controller: controllerDescription,
              isLocation: false,
            ),
            const TextWidget(txt: "Event location"),
            FormFieldWidget(
              numberLine: 1,
              controller: controllerLocation,
              isLocation: true,
            ),
            const TextWidget(txt: "Priority Color"),
            const SizedBox(height: 10),
            //dropdown
            SizedBox(
              width: 90.w,
              child: DropdownButtonFormField<Color>(
                icon: SvgPicture.asset(AppIcons.arrowDown,
                    height: 24.w, width: 24.w),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: AppColors.grey100,
                ),
                value: AppColors.blue,
                dropdownColor: AppColors.grey100,
                borderRadius: BorderRadius.circular(8.r),
                isExpanded: true,
                hint: Container(
                  height: 16,
                  width: 16,
                  color: AppColors.blue,
                ),
                items: [
                  DropdownMenuItem(
                    value: AppColors.blue,
                    child: Container(
                      height: 16,
                      width: 16,
                      color: AppColors.blue,
                    ),
                  ),
                  DropdownMenuItem(
                    value: AppColors.red,
                    child: Container(
                      height: 16,
                      width: 16,
                      color: AppColors.red,
                    ),
                  ),
                  DropdownMenuItem(
                    value: AppColors.orange,
                    child: Container(
                      height: 16,
                      width: 16,
                      color: AppColors.orange,
                    ),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
            const Spacer(),
            //button
            SizedBox(
              width: double.infinity,
              height: 46.h,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
