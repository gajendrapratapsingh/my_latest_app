import 'package:get/get.dart';
import 'package:myapp/controllers/LoginController.dart';
import 'package:myapp/controllers/MyController.dart';
import 'package:myapp/controllers/UserController.dart';
import 'package:myapp/services/UserService.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(UserService());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<UserController>(() => UserController());
    Get.put(MyController());
    //Get.lazyPut<UserService>(() => UserService());
  }
}
