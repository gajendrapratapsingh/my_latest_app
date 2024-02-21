import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = "English".obs;

  void setSelectedLanguage(String language) {
    selectedLanguage.value = language;
    if(language == "English"){
      Get.updateLocale(const Locale('en', 'US'));
    }
    else{
      Get.updateLocale(const Locale('hi', 'IN'));
    }
  }
}
