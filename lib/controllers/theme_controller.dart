import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/theme/custom_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum ThemeMode { light, dark }

class ThemeController extends GetxController {
  late SharedPreferences prefs;

  var themeMode = ThemeMode.light.obs;

  void toggleTheme() {
    if(themeMode.value == ThemeMode.light) {
      Get.changeTheme(CustomTheme.darkTheme);
      themeMode.value = ThemeMode.dark;
    } else {
      Get.changeTheme(CustomTheme.lightTheme);
      themeMode.value = ThemeMode.light;
    }
  }

  bool getTheme() {
    return themeMode.value == ThemeMode.light ? true : false;
  }

  // Future<void> changeTheme() async {
  //   prefs = await SharedPreferences.getInstance();
  //
  //   if(selectedTheme.value == Get.isDarkMode) {
  //     print("Selected Theme ${selectedTheme.value}");
  //     selectedTheme.value = CustomTheme.lightTheme;
  //     Get.changeTheme(CustomTheme.lightTheme);
  //     await prefs.setBool("isDark", false);
  //   } else {
  //     selectedTheme.value = CustomTheme.darkTheme;
  //     Get.changeTheme(CustomTheme.darkTheme);
  //     await prefs.setBool("isDark", true);
  //   }
  // }
}


