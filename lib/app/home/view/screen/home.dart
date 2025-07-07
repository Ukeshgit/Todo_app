import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/authentication/controller/timepicker_controller.dart';
import 'package:todo_app/app/authentication/widgets/logout.dart';
import 'package:todo_app/app/home/controller/api/todo_controller.dart';
import 'package:todo_app/app/home/view/dialogbox/add_dialog.dart';
import 'package:todo_app/app/home/view/dialogbox/delete_dialog.dart';
import 'package:todo_app/app/home/view/dialogbox/edit_dialog.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/consts/theme/contoller/theme_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    TodoController todoController = Get.put(TodoController());
    Timepicker timepickercontroller = Get.put(Timepicker());

    return Scaffold(
      appBar: AppBar(
        title: const Text('T O D O'),
        leading: IconButton(
          onPressed: () {
            themeController.changeTheme();
          },
          icon: Obx(() => themeController.isDark.value
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode)),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Logout(),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: addDialog,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12.sp)),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 24.sp,
                    color: Appcolors.lightDivColor,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    "ADD NOTE",
                    style: TextStyle(
                        letterSpacing: 1.5, color: Appcolors.lightDivColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Todos",
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todolist.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(12.sp)),
                          margin: EdgeInsets.only(bottom: 20.h),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 60.h,
                          child: Row(children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12.r,
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 190.w,
                                  child: Text(
                                      todoController.todolist[index].title,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Appcolors.lightDivColor,
                                          fontSize: 16.sp)),
                                ),
                                //timepicker
                                //selected the logic for unique time tomorrow
                                Text(
                                    "${timepickercontroller.selectedTime.hour.toString()}:${timepickercontroller.selectedTime.minute.toString()}",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Appcolors.lightDivColor,
                                        fontSize: 16.sp)),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  editDialog(todoController.todolist[index]);
                                },
                                icon: const Icon(Icons.edit,
                                    color: Appcolors.lightDivColor)),
                            IconButton(
                                onPressed: () {
                                  deleteDialog(todoController.todolist[index]);
                                },
                                icon: Icon(Icons.delete,
                                    color: Appcolors.lightDivColor)),
                          ]));
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
