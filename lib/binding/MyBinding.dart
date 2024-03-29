import 'package:get/get.dart';
import 'package:myapp/controllers/LoginController.dart';
import 'package:myapp/controllers/MyController.dart';
import 'package:myapp/controllers/SplashController.dart';
import 'package:myapp/controllers/UserController.dart';
import 'package:myapp/controllers/language_controller.dart';
import 'package:myapp/controllers/theme_controller.dart';
import 'package:myapp/services/UserService.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(UserService());
    Get.put(ThemeController());
    Get.put(SplashController());
    //Get.lazyPut<SplashController>(() => SplashController());
    Get.put(LoginController());
    Get.put(UserController());
    Get.put(ThemeController());
    Get.put(LanguageController());
    //Get.lazyPut<LoginController>(() => LoginController());
    //Get.lazyPut<UserController>(() => UserController());
    Get.put(MyController());
    //Get.lazyPut<UserService>(() => UserService());
  }
}
