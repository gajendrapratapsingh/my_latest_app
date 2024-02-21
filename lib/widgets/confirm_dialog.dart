import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes/routes.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      //contentPadding: EdgeInsets.zero,
      icon: Image.asset(height: 32, width: 32, 'assets/images/logout.png', fit: BoxFit.contain),
      title: Text(
        Strings.logoutcfrm.tr,
        style: TextStyle(color: Colors.black),
      ),
      content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.pop(context, true);
                  Get.offAndToNamed(Routes.loginScreen);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green),
                child: SizedBox(
                  width: 60,
                  child: Text(
                    Strings.yesbtn.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                style:
                ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: SizedBox(
                  width: 60,
                  child: Text(
                    Strings.nobtn.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ]),
    );
  }
}
