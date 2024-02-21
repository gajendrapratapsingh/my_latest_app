import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/theme/colors.dart';

class AppUtils{

   static const String baseurl = "https://jsonplaceholder.typicode.com/";

   static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
   static formatDate(DateTime date) => DateFormat.yMd().format(date);

   static void showWarning(BuildContext context, String value) {
      Flushbar(
         message: value,
         messageColor: Colors.white,
         forwardAnimationCurve: Curves.decelerate,
         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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

   static void showExitMessage(BuildContext context, String value) {
      Flushbar(
         message: value,
         messageColor: Colors.white,
         forwardAnimationCurve: Curves.decelerate,
         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
         padding: const EdgeInsets.all(15),
         titleColor: Colors.white,
         borderRadius: BorderRadius.circular(10),
         reverseAnimationCurve: Curves.easeOut,
         flushbarPosition: FlushbarPosition.BOTTOM,
         positionOffset: 20,
         backgroundColor: AppColors.kAppBarColor,
         duration: const Duration(seconds: 2),
      ).show(context);
   }


   static void showToastMessage(String msg){
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
   }

   static error(String message) {
      return Get.snackbar('Alert', message,
          backgroundColor: Colors.red, colorText: Colors.white);
   }

   static networkError(String message) {
      return Get.snackbar('Network Error', message,
          backgroundColor: Colors.red, colorText: Colors.white);
   }

   static toastMessage(String message){
      return Fluttertoast.showToast(msg: message, backgroundColor: Colors.black, textColor: Colors.white, fontSize: 14);
   }

   static backPress(String message) {
      return Fluttertoast.showToast(msg: message, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, fontSize: 14);
   }

   static Future<bool> checkconnection() async {
      var connectivityresult;
      try {
         connectivityresult = await InternetAddress.lookup('google.com');
         if (connectivityresult != null) {
            return true;
         }
      } on SocketException catch (_) {
         return false;
      }
      return false;
   }
}