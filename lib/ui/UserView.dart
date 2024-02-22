import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/UserController.dart';
import 'package:myapp/controllers/language_controller.dart';
import 'package:myapp/controllers/network_controller.dart';
import 'package:myapp/controllers/theme_controller.dart';
import 'package:myapp/models/User.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/ui/noInternet.dart';
import 'package:myapp/utils/routes/routes.dart';
import 'package:myapp/utils/strings.dart';
import 'package:myapp/widgets/confirm_dialog.dart';

class UserView extends GetView<UserController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<String> list = <String>['English', 'हिन्दी'];

  final LanguageController _languageController = Get.find<LanguageController>();

  final networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    // final arguments = Get.arguments;
    // final String username = arguments['username'];
    // final String email = arguments['email'];
    // final String image = arguments['picture'];

    return WillPopScope(
      onWillPop: () async {
        controller.handleBackButton();
        return false;
      },
      child: Obx(() => networkController.connectionStatus.value == 0 ? NoInternet() : Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("${Strings.appName.tr}"),
          actions: [
            // PopupMenuButton(
            //   shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(15))),
            //   position: PopupMenuPosition.under,
            //   icon: const Icon(Icons.message),
            //   itemBuilder: (context) {
            //     return [
            //       PopupMenuItem(
            //         value: 'New Chat',
            //         child: const ListTile(
            //             leading: Icon(CupertinoIcons.chat_bubble_2_fill),
            //             title: Text('New Chat', maxLines: 1)),
            //         onTap: () {},
            //       ),
            //       PopupMenuItem(
            //         value: 'New Group',
            //         child: const ListTile(
            //             leading: Icon(CupertinoIcons.person_2_fill),
            //             title: Text('New Group', maxLines: 1)),
            //         onTap: () {},
            //       ),
            //       PopupMenuItem(
            //         value: 'Join Group',
            //         child: const ListTile(
            //             leading: Icon(Icons.group_add),
            //             title: Text('Join Group', maxLines: 1)),
            //         onTap: () {},
            //       ),
            //     ];
            //   },
            // )
            Obx(() => Container(
              width: 100,
              child: DropdownButton(
                isExpanded: true,
                focusColor: Colors.white,
                icon: Image.asset('assets/images/translate_logo.png', height: 60, width: 60),
                underline: const SizedBox(),
                onChanged: (value) {
                  if(value == null) return;
                  _languageController.setSelectedLanguage(value);
                  //Provider.of<LanguageProvider>(context, listen: false).updateLanguage(value);
                },
                value: null,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(value,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        if(_languageController.selectedLanguage == value)
                          Icon(
                            Icons.check_box,
                            color: Colors.blue,
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ))
          ],
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon:
              const FaIcon(FontAwesomeIcons.navicon, color: Colors.white)),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      // decoration: const BoxDecoration(
                      //   color: AppColors.kAppBarColor,
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              border: Border.all(),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                controller.image,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Image.asset('assets/images/person.png', fit: BoxFit.cover);
                                  }
                                },
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return Image.asset('assets/images/person.png', fit: BoxFit.cover);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(controller.name),
                          Text(controller.email.toLowerCase()),
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
                      leading: const Icon(Icons.info, color: Colors.green),
                      title: const Text('About'),
                      onTap: () {
                        // Navigate to about page
                      },
                    ),
                    Obx(() => ListTile(
                      leading: Get.find<ThemeController>().getTheme() ? Container(height: 32, width: 32, child: Image.asset('assets/images/moon.png')) : Container(height: 32, width: 32, child: Image.asset('assets/images/sun.png')), // Change color here
                      title: Get.find<ThemeController>().getTheme() ? Text("${Strings.nightmode.tr}") : Text("${Strings.lightmode.tr}"),
                      onTap: () {
                        if(_scaffoldKey.currentState!.isDrawerOpen) {
                          _scaffoldKey.currentState!.closeDrawer();
                          Get.find<ThemeController>().toggleTheme();
                        }
                      },
                    )),
                    ListTile(
                      leading: const Icon(Icons.menu, color: Colors.orange), // Change color here
                      title: const Text('Menu'),
                      onTap: () {
                        // Implement menu functionality
                      },
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          if(_scaffoldKey.currentState!.isDrawerOpen) {
                            _scaffoldKey.currentState!.closeDrawer();
                            Get.dialog(ConfirmDialog());
                          }
                        },
                        child: Container(
                          height: 45,
                          color: AppColors.kAppBarColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, color: Colors.white),
                              SizedBox(width: 10),
                              Text("${Strings.logout.tr}", style: TextStyle(fontSize: 16, color: Colors.white))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Get.find<ThemeController>().toggleTheme();
            },
            child: const Icon(Icons.add, color: Colors.white)),
        body: Obx(() {
          switch (controller.state.value) {
            case UserState.loading:
              return const Center(
                  child: CircularProgressIndicator(color: Colors.grey));
            case UserState.success:
              return ListView.builder(
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
            case UserState.failure:
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/no_data.png',
                            height: 80, width: 80, fit: BoxFit.cover),
                        const SizedBox(height: 5.0),
                        const Text("Data not found")
                      ]));
          }
        }),
      )),
    );
  }

  void showBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
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
      if (value != null) {
        print('Selected: $value');
      }
    });
  }
}
