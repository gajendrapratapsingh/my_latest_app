import 'dart:async';

import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0.obs;

  var tabEnabled = true.obs;

  void disableTab() {
    tabEnabled.value = false;
    Timer(const Duration(seconds: 2), () {
      tabEnabled.value = true;
    });
  }

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }
}
