import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/api/ApiProvider.dart';
import 'package:myapp/models/User.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/utils/AppUtils.dart';
import 'package:myapp/utils/strings.dart';

enum UserState { loading, success, failure }

class UserController extends GetxController {
  //final UserService _userService = Get.put(UserService());
  //final UserService _userService = Get.find<UserService>();
  final ApiProvider _apiProvider = ApiProvider();
  final users = <User>[].obs;
  final state = UserState.loading.obs;

  Box? myAppBox;

  late String name, email, image;

  @override
  void onInit() {
    myAppBox = Hive.box("myAppBox");
    super.onInit();
    fetchUsers();
    name = myAppBox?.get('username');
    email = myAppBox?.get('email');
    image = myAppBox?.get('picture');
  }

  @override
  void onClose() {
    // Clean up resources when the controller is disposed
    print('Controller disposed');
    super.onClose();
  }

  Future<void> fetchUsers() async {
    try {
      state(UserState.loading);
      final List<User> userList = await _apiProvider.getUsers();
      users.assignAll(userList);
      state(UserState.success);
    } catch (e) {
      print('Error: $e');
      state(UserState.failure);
    }
  }

  DateTime? lastPressedTime;
  void handleBackButton() {
    final currentTime = DateTime.now();
    if(lastPressedTime == null || currentTime.difference(lastPressedTime!) > const Duration(seconds: 2)) {
      lastPressedTime = currentTime;
      AppUtils.backPress(Strings.backpress.tr);
    } else {
      //Get.back(); // Close the current screen
      // Alternatively, you can use SystemNavigator.pop() to exit the app completely
      SystemNavigator.pop();
    }
  }
}
