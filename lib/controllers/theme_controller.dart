import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/theme/custom_theme_data.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  ThemeData getTheme() {
    return isDarkMode.value ? CustomTheme.darkTheme : CustomTheme.lightTheme;
  }
}


