import 'dart:async';

import 'package:get/get.dart';
import 'package:myapp/utils/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController{

  @override
  void onInit(){
    // TODO: implement onInit
    super.onInit();
    checklogin();
  }

  void checklogin() async{
    print("my splash");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 3),(){
      if(prefs.containsKey('islogin')) {
        bool? isLogin = prefs.getBool('islogin');
        if (isLogin != null && isLogin) {
          Get.offNamed(Routes.userScreen);
        } else {
          Get.offNamed(Routes.loginScreen);
        }
      }
      else{
        Get.offNamed(Routes.loginScreen);
      }
    });
  }

}