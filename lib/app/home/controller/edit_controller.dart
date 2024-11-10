import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  final TextEditingController editingcontroller = TextEditingController();
  @override
  void dispose() {
    editingcontroller.dispose();

    super.dispose();
  }
}
