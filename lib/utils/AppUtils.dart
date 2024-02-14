import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppUtils{

   static const String baseurl = "https://jsonplaceholder.typicode.com/";

   static void showWarning(BuildContext context, String value) {
      Flushbar(
         message: value,
         messageColor: Colors.white,
         forwardAnimationCurve: Curves.decelerate,
         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
         padding: const EdgeInsets.all(15),
         titleColor: Colors.white,
         borderRadius: BorderRadius.circular(10),
         reverseAnimationCurve: Curves.easeOut,
         flushbarPosition: FlushbarPosition.BOTTOM,
         positionOffset: 20,
         backgroundColor: Colors.red,
         duration: const Duration(seconds: 2),
      ).show(context);
   }
}