import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/home/controller/add_controller.dart';
import 'package:todo_app/app/home/controller/api/todo_controller.dart';
import 'package:todo_app/app/home/controller/edit_controller.dart';
import 'package:todo_app/app/home/view/widget/timepicker_controller.dart';
import 'package:todo_app/consts/colors.dart';

void addDialog() {
  AddController adddataController = Get.put(AddController());
  TodoController todoController = Get.put(TodoController());
  Timepicker timepickercontroller = Get.put(Timepicker());
  showDialog(
      context: Get.overlayContext!,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp)),
          content: Container(
            height: 160.h,
            padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
            child: Column(
              children: [
                Center(
                    child: Text(
                  "Enter New Task",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20.sp),
                )),
                TextFormField(
                  controller: adddataController.addcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter Task",
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () async {
                    final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: timepickercontroller.selectedTime,
                        initialEntryMode: TimePickerEntryMode.dial);
                    if (timeOfDay != null) {
                      timepickercontroller.selectedTime = timeOfDay;
                    }
                  },
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color: Theme.of(context).colorScheme.primary),
                    child: Center(
                        child: Text(
                      "Enter Time",
                      style: TextStyle(color: Appcolors.lightDivColor),
                    )),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("cancel")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  todoController.postdata(
                      adddataController.addcontroller.text.toString());
                  Get.back();
                  adddataController.addcontroller.clear();
                  print(todoController);
                },
                child: Text(
                  "save ",
                  style: TextStyle(color: Appcolors.lightDivColor),
                )),
          ],
        );
      });
}
