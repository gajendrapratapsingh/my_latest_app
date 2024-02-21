import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/strings.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Get.height/6),
            Image.asset(height: 300, width: Get.width, 'assets/images/connection_error.jpg'),
            SizedBox(height: 20),
            Text(Strings.errortitle.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
            SizedBox(height: 10),
            Text(Strings.errordesc.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
            const Spacer(),
            GestureDetector(
             child: Container(
               height: 45.0,
               width: Get.width,
               alignment: Alignment.center,
               color: Colors.deepOrange,
               child: Text(Strings.tryagainbtn.tr, style: TextStyle(color: Colors.white)),
             ),
            )
          ],
        ),
      ),
    );
  }
}
