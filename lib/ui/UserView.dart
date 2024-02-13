import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/UserController.dart';
import 'package:myapp/models/User.dart';

class UserView extends GetView<UserController> {

  //final UserController controller = Get.put(UserController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('My App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        leading: IconButton(onPressed: (){
          _scaffoldKey.currentState!.openDrawer();
        }, icon: const Icon(Icons.menu, color: Colors.white)),
      ),
      drawer: Drawer(backgroundColor: Colors.white, elevation: 0, child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.red), // Change color here
          title: const Text('Settings'),
          onTap: () {
            // Navigate to settings page
          },
        ),
        ListTile(
          leading: const Icon(Icons.info, color: Colors.green), // Change color here
          title: const Text('About'),
          onTap: () {
            // Navigate to about page
          },
        ),
      ],)),
      body: Obx(() {
          switch (controller.state.value) {
            case UserState.loading: return const Center(child: CircularProgressIndicator(color: Colors.grey));
            case UserState.success: return ListView.builder(
                itemCount: controller.users.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  User user = controller.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            case UserState.failure: return const Center(child: Text('Failed to load users'));
          }
        },
      ),
    );
  }
}
