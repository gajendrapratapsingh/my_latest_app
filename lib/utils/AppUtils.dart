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

   //static const kPrimaryColor = Color(0xFF00BF6D);
   static const kSecondaryColor = Color(0xFFFE9901);
   static const kContentColorLightTheme = Color(0xFF1D1D35);
   static const kContentColorDarkTheme = Color(0xFFF5FCF9);
   static const kWarninngColor = Color(0xFFF3BB1C);
   static const whiteColor = Color(0xFFFFFFFF);
   static const blackColor = Color(0xFF000000);
   static const kErrorColor = Color(0xFFF03738);
   static const kLightGrey = Color(0xFFE0E0E0);

   // Colors
   static const kPrimaryColor = Color(0xFFFF97B3);
   static const kSecondaryLightColor = Color(0xFFE4E9F2);
   static const kSecondaryDarkColor = Color(0xFF404040);
   static const kAccentLightColor = Color(0xFFB3BFD7);
   static const kAccentDarkColor = Color(0xFF4E4E4E);
   static const kBackgroundDarkColor = Color(0xFF3A3A3A);
   static const kSurfaceDarkColor = Color(0xFF222225);
   // Icon Colors
   static const kAccentIconLightColor = Color(0xFFECEFF5);
   static const kAccentIconDarkColor = Color(0xFF303030);
   static const kPrimaryIconLightColor = Color(0xFFECEFF5);
   static const kPrimaryIconDarkColor = Color(0xFF232323);
   // Text Colors
   static const kBodyTextColorLight = Color(0xFFA1B0CA);
   static const kBodyTextColorDark = Color(0xFF7C7C7C);
   static const kTitleTextLightColor = Color(0xFF101112);
   static const kTitleTextDarkColor = Colors.white;

   static const kShadowColor = Color(0xFF364564);

   static const kDefaultPadding = 20.0;

   static void showWarning(BuildContext context, String value) {
      Flushbar(
         message: value,
         messageColor: whiteColor,
         forwardAnimationCurve: Curves.decelerate,
         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
         padding: const EdgeInsets.all(15),
         titleColor: Colors.white,
         borderRadius: BorderRadius.circular(10),
         reverseAnimationCurve: Curves.easeOut,
         flushbarPosition: FlushbarPosition.BOTTOM,
         positionOffset: 20,
         backgroundColor: kErrorColor,
         duration: const Duration(seconds: 2),
      ).show(context);
   }

   static void showExitMessage(BuildContext context, String value) {
      Flushbar(
         message: value,
         messageColor: whiteColor,
         forwardAnimationCurve: Curves.decelerate,
         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
         padding: const EdgeInsets.all(15),
         titleColor: whiteColor,
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
          backgroundColor: kErrorColor,
          textColor: whiteColor,
          fontSize: 16.0
      );
   }

   static error(String message) {
      return Get.snackbar('Alert', message,
          backgroundColor: kErrorColor, colorText: Colors.white);
   }

   static networkError(String message) {
      return Get.snackbar('Network Error', message,
          backgroundColor: kErrorColor, colorText: whiteColor);
   }

   static toastMessage(String message){
      return Fluttertoast.showToast(msg: message, backgroundColor: blackColor, textColor: whiteColor, fontSize: 14);
   }

   static backPress(String message) {
      return Fluttertoast.showToast(msg: message, backgroundColor: blackColor, textColor: whiteColor, gravity: ToastGravity.BOTTOM, fontSize: 14);
   }

   static Future<bool> checkconnection() async {
      var connectivityresult;
      try {
         connectivityresult = await InternetAddress.lookup('google.com');
         if(connectivityresult != null) {
            return true;
         }
      } on SocketException catch (_){
         return false;
      }
      return false;
   }
}