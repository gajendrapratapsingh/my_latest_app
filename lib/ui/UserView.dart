import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/UserController.dart';
import 'package:myapp/models/User.dart';
import 'package:myapp/ui/MyView.dart';
import 'package:myapp/utils/routes/routes.dart';

class UserView extends GetView<UserController> {

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
        }, icon: const FaIcon(FontAwesomeIcons.navicon, color: Colors.white)),
        actions: [
          IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.asterisk, color: Colors.white))
        ],
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
      floatingActionButton: FloatingActionButton(onPressed: (){showBottomSheet();}, backgroundColor: Colors.red, child: const Icon(Icons.add, color: Colors.white)),
      body: Obx(() {
          switch (controller.state.value) {
            case UserState.loading: return const Center(child: CircularProgressIndicator(color: Colors.grey));
            case UserState.success: return ListView.builder(
                itemCount: controller.users.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  User user = controller.users[index];
                  return GestureDetector(
                    onTap: () {
                      //Get.to(const MyView());
                      //Get.offAndToNamed(Routes.otpScreen, arguments: loginResponse[0].mobile.toString());
                      Get.toNamed(Routes.myScreen);
                    },
                    child: ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    ),
                  );
                },
              );
            case UserState.failure: return const Center(child: Text('Failed to load users'));
          }
        },
      ),
    );
  }


  void showBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
        ),
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Music'),
              onTap: () => Get.back(result: 'Music'),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Photo'),
              onTap: () => Get.back(result: 'Photo'),
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => Get.back(result: 'Video'),
            ),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
    ).then((value) {
      // Handle bottom sheet result
      if(value != null) {
        print('Selected: $value');
      }
    });
  }
}
