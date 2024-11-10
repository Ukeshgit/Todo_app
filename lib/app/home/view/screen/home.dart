import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/home/view/dialogbox/edit_dialog.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/consts/theme/contoller/theme_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());

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
      ),
      bottomNavigationBar: Row(
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
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(12.sp)),
                        margin: EdgeInsets.only(bottom: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 50.h,
                        child: Row(children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12.r,
                              child: Icon(Icons.add,
                                  size: 20.sp, color: Colors.black)),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text("This is a dummy text",
                              style: TextStyle(
                                  color: Appcolors.lightDivColor,
                                  fontSize: 16.sp)),
                          SizedBox(
                            width: 41.w,
                          ),
                          const IconButton(
                              onPressed: editDialog,
                              icon: Icon(Icons.edit,
                                  color: Appcolors.lightDivColor)),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete,
                                  color: Appcolors.lightDivColor)),
                        ]));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
