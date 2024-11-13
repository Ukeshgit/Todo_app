import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  final TextEditingController addcontroller = TextEditingController();
  @override
  void dispose() {
    addcontroller.dispose();

    super.dispose();
  }
}
