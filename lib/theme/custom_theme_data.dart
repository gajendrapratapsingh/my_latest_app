import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey.shade50,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6750a4),
      onPrimary: Color(0xFFffffff),
      primaryContainer: Color(0xFFe9ddff),
      onPrimaryContainer: Color(0xFF22005d),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 21),
      color: Colors.orange,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFcfbcff),
      onPrimary: Color(0xFF381e72),
      primaryContainer: Color(0xFF4f378a),
      onPrimaryContainer: Color(0xFFe9ddff),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 21),
      color: Colors.grey.shade700,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );

  // //LightTheme
  // static ThemeData lightTheme = ThemeData(
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.white,
  //   brightness: Brightness.light,
  //   backgroundColor: const Color(0xFFE5E5E5),
  //   dividerColor: Colors.white54,
  // );
  // TextStyle lightTextStyle = TextStyle(
  //   fontSize: 20,
  //   color: Colors.black,
  // );
  // TextTheme lightTextTheme = TextTheme(
  //   bodyText1:TextStyle(color: Colors.black),
  // );
  //
  // //DarkTheme
  // static ThemeData darkTheme = ThemeData(
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.black,
  //   brightness: Brightness.dark,
  //   backgroundColor: const Color(0xFF212121),
  //   dividerColor: Colors.black12,
  // );
  // TextStyle darkTextStyle = TextStyle(
  //   fontSize: 20,
  //   color: Colors.white,
  // );
  // TextTheme darkTextTheme = TextTheme(
  //   bodyText1: TextStyle(color: Colors.white),
  // );

  // static ThemeData lightTheme = ThemeData(
  //   primaryColor: AppColors.kAppBarColor,
  //   hintColor: AppColors.kPrimaryColor,
  //   scaffoldBackgroundColor: Colors.white,
  //   cardColor: Colors.white,
  //   drawerTheme: DrawerThemeData(
  //
  //   ),
  //   datePickerTheme: DatePickerThemeData(
  //     backgroundColor: Colors.white
  //   ),
  //   colorScheme: ColorScheme.light(
  //     primary: Colors.blue,
  //     onPrimary: Colors.white,
  //     secondary: Colors.blue,
  //     onSecondary: Colors.white,
  //     error: Colors.red,
  //     onError: Colors.white,
  //     background: Colors.white,
  //     onBackground: Colors.white,
  //     surface: Colors.white,
  //     onSurface: Colors.black,
  //   ),
  //   appBarTheme: AppBarTheme(
  //     color: Colors.blue,
  //     iconTheme: IconThemeData(color: Colors.white),
  //     titleTextStyle: TextStyle(color: Colors.white, fontSize: 21),
  //     // textTheme: TextTheme(
  //     //   headline6: TextStyle(
  //     //     color: Colors.white,
  //     //     fontSize: 20,
  //     //     fontWeight: FontWeight.bold,
  //     //   ),
  //     // ),
  //     systemOverlayStyle: SystemUiOverlayStyle.dark,
  //   ),
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(color: Colors.black),
  //     bodyText2: TextStyle(color: Colors.black87),
  //     headline6: TextStyle(color: Colors.black, fontSize: 18),
  //   ),
  //   buttonTheme: ButtonThemeData(
  //     buttonColor: AppColors.kButtonColor,
  //     textTheme: ButtonTextTheme.primary,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //   ),
  // );
  //
  // static ThemeData darkTheme = ThemeData.dark().copyWith(
  //   primaryColor: Colors.blueGrey[800],
  //   hintColor: Colors.orange,
  //   scaffoldBackgroundColor: Colors.grey[900],
  //   drawerTheme: DrawerThemeData(
  //     backgroundColor: Colors.blueGrey[800],
  //     elevation: 4,
  //     shadowColor: Colors.white
  //   ),
  //   datePickerTheme: DatePickerThemeData(),
  //   cardColor: Colors.blueGrey[800],
  //   badgeTheme: BadgeThemeData(),
  //   colorScheme: ColorScheme.dark(
  //     primary: Colors.grey,
  //     onPrimary: Colors.white,
  //     secondary: Colors.teal,
  //     onSecondary: Colors.white,
  //     error: Colors.red,
  //     onError: Colors.white,
  //     background: Colors.grey[900]!,
  //     onBackground: Colors.white,
  //     surface: Colors.white,
  //     onSurface: Colors.white,
  //   ),
  //   appBarTheme: AppBarTheme(
  //     color: Colors.blueGrey[800],
  //     iconTheme: IconThemeData(color: Colors.white),
  //     titleTextStyle: TextStyle(color: Colors.white, fontSize: 21),
  //     systemOverlayStyle: SystemUiOverlayStyle.light,
  //   ),
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(color: Colors.white),
  //     bodyText2: TextStyle(color: Colors.white),
  //     headline6: TextStyle(color: Colors.white, fontSize: 18),
  //   ),
  //   buttonTheme: ButtonThemeData(
  //     buttonColor: Colors.blueGrey[800],
  //     textTheme: ButtonTextTheme.primary,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //   ),
  // );
}
