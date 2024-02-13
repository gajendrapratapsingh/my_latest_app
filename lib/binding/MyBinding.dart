import 'package:get/get.dart';
import 'package:myapp/controllers/MyController.dart';
import 'package:myapp/controllers/UserController.dart';
import 'package:myapp/services/UserService.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<MyController>(() => MyController());
    Get.put(UserService());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<UserService>(() => UserService());
  }
}
