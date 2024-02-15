import 'package:get/get.dart';
import 'package:myapp/api/ApiProvider.dart';
import 'package:myapp/models/User.dart';

enum UserState { loading, success, failure }

class UserController extends GetxController {
  //final UserService _userService = Get.put(UserService());
  //final UserService _userService = Get.find<UserService>();
  final ApiProvider _apiProvider = ApiProvider();
  final users = <User>[].obs;
  final state = UserState.loading.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
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
}
