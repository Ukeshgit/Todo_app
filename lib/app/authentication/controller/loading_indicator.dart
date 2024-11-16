import 'package:get/get.dart';

class LoadingIndicator extends GetxController {
  RxBool isLoading = false.obs;

  void isChanged() {
    isLoading.value = !isLoading.value;
  }
}
