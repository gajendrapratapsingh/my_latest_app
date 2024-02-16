import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/UserController.dart';
import 'package:myapp/models/User.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/ui/MyView.dart';
import 'package:myapp/utils/AppUtils.dart';
import 'package:myapp/utils/routes/routes.dart';

class UserView extends GetView<UserController> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    // final arguments = Get.arguments;
    // final String username = arguments['username'];
    // final String email = arguments['email'];
    // final String image = arguments['picture'];

    return WillPopScope(
      onWillPop: () async{
        controller.handleBackButton();
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('My App', style: TextStyle(color: Colors.white)),
          backgroundColor: AppColors.kAppBarColor,
          leading: IconButton(onPressed: (){
            _scaffoldKey.currentState!.openDrawer();
          }, icon: const FaIcon(FontAwesomeIcons.navicon, color: Colors.white)),
          // actions: [
          //   IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.asterisk, color: Colors.white))
          // ],
        ),
        drawer: Drawer(backgroundColor: Colors.white, elevation: 0, child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.kAppBarColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 75, width: 75, decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0), border: Border.all(color: Colors.white)), child: ClipOval(child: Image.network(controller.image, fit: BoxFit.cover,loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if(loadingProgress == null) {
                    return child;
                  } else {
                    return Image.asset('assets/images/person.png', fit: BoxFit.cover);
                  }
                }, errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Image.asset('assets/images/person.png', fit: BoxFit.cover);
                }))),
                const SizedBox(height: 5.0),
                Text(controller.name, style: const TextStyle(color: Colors.white)),
                Text(controller.email.toLowerCase(), style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
              ],
            ),
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
        floatingActionButton: FloatingActionButton(onPressed: (){showBottomSheet();}, backgroundColor: AppColors.kAppBarColor, child: const Icon(Icons.add, color: Colors.white)),
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
          }),
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
              leading: const Icon(Icons.music_note),
              title: const Text('Music'),
              onTap: () => Get.back(result: 'Music'),
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Photo'),
              onTap: () => Get.back(result: 'Photo'),
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Video'),
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
