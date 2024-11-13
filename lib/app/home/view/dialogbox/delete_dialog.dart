import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/home/controller/api/todo_controller.dart';
import 'package:todo_app/app/home/controller/edit_controller.dart';
import 'package:todo_app/app/home/model/todo_model.dart';
import 'package:todo_app/consts/colors.dart';

void deleteDialog(TodoModel deletecontroller) {
  TodoController todoController = Get.put(TodoController());

  showDialog(
      context: Get.overlayContext!,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp)),
          title: Text(
            "Are you sure you want to delete?",
            style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.onPrimary),
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
                  todoController.deletedata(deletecontroller.id);
                  Get.back();
                },
                child: Text(
                  "Ok",
                  style: TextStyle(color: Appcolors.lightDivColor),
                )),
          ],
        );
      });
}
