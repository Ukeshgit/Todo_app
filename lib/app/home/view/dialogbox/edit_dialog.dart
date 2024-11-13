import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/home/controller/api/todo_controller.dart';
import 'package:todo_app/app/home/controller/edit_controller.dart';
import 'package:todo_app/app/home/model/todo_model.dart';
import 'package:todo_app/consts/colors.dart';

void editDialog(TodoModel updatecontroller) {
  EditController editController = Get.put(EditController());
  TodoController todoController = Get.put(TodoController());
  showDialog(
      context: Get.overlayContext!,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp)),
          content: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
            child: Column(
              children: [
                Center(
                    child: Text(
                  "Edit Task",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20.sp),
                )),
                TextFormField(
                  controller: editController.editingcontroller,
                  decoration: InputDecoration(
                      hintText: "Edit task",
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                ),
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
                  todoController.updatedata(
                      editController.editingcontroller.text.toString(),
                      updatecontroller.id.toString());
                  Get.back();
                },
                child: Text(
                  "save ",
                  style: TextStyle(color: Appcolors.lightDivColor),
                )),
          ],
        );
      });
}
