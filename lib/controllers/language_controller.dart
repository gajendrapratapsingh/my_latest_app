import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var selectedLanguage = "English".obs;

  void setSelectedLanguage(String language) {
    selectedLanguage.value = language;
    if(language == "English"){
      Get.updateLocale(const Locale('en', 'US'));
      saveLanguage('en');
    }
    else{
      Get.updateLocale(const Locale('hi', 'IN'));
      saveLanguage('hi');
    }
  }

  void saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', languageCode);
  }
}
