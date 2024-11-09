import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/theme/contoller/theme_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('T H E M E'),
        leading: IconButton(
          onPressed: () {
            themeController.changeTheme();
          },
          icon: Obx(() => themeController.isDark.value
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Text(
                "Box ${index}",
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary),
              )),
            );
          },
        ),
      ),
    );
  }
}
