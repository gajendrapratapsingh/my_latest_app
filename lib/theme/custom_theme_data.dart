import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/theme/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.kAppBarColor,
    hintColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: AppColors.kAppBarColor,
      iconTheme: IconThemeData(color: Colors.white),
      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: Colors.white,
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black87),
      headline6: TextStyle(color: Colors.black, fontSize: 18),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.kButtonColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey[800],
    hintColor: Colors.orange,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey[800],
      iconTheme: IconThemeData(color: Colors.white),
      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: Colors.white,
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white70),
      headline6: TextStyle(color: Colors.white, fontSize: 18),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueGrey[800],
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
