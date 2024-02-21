import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/theme/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.kAppBarColor,
    hintColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white
    ),
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 21),
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
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.blueGrey[800],
      elevation: 4,
      shadowColor: Colors.black
    ),
    datePickerTheme: DatePickerThemeData(),
    cardColor: Colors.blueGrey[800],
    colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey[800],
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 21),
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