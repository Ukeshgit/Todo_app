import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/home/view/screen/home.dart';
import 'package:todo_app/theme/view/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
