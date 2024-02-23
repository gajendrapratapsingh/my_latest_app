import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils/AppUtils.dart';

class CustomTheme {
  // static const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
  //
  // // Light TextTheme
  // static const lightTextTheme = TextTheme(
  //   headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //   headline2: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //   bodyText1: TextStyle(fontSize: 16, color: Colors.black),
  //   bodyText2: TextStyle(fontSize: 14, color: Colors.grey),
  // );
  //
  // // Dark TextTheme
  // static const darkTextTheme = TextTheme(
  //   headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //   headline2: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //   bodyText1: TextStyle(fontSize: 16, color: Colors.white),
  //   bodyText2: TextStyle(fontSize: 14, color: AppUtils.kLightGrey)
  // );
  //
  // static ThemeData lightTheme = ThemeData.light().copyWith(
  //   useMaterial3: true,
  //   primaryColor: AppUtils.kPrimaryColor,
  //   scaffoldBackgroundColor: AppUtils.whiteColor,
  //   appBarTheme: appBarTheme,
  //   iconTheme: const IconThemeData(color: AppUtils.kContentColorLightTheme),
  //   textTheme: GoogleFonts.interTextTheme(lightTextTheme).apply(bodyColor: AppUtils.kContentColorLightTheme),
  //   colorScheme: const ColorScheme.light(
  //     primary: AppUtils.kPrimaryColor,
  //     secondary: AppUtils.kSecondaryColor,
  //     error: AppUtils.kErrorColor,
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     backgroundColor: Colors.white,
  //     selectedItemColor: AppUtils.kContentColorLightTheme.withOpacity(0.7),
  //     unselectedItemColor: AppUtils.kContentColorLightTheme.withOpacity(0.32),
  //     selectedIconTheme: const IconThemeData(color: AppUtils.kPrimaryColor),
  //     showUnselectedLabels: true,
  //   ),
  // );
  //
  // static ThemeData darkTheme = ThemeData.dark().copyWith(
  //   useMaterial3: true,
  //   primaryColor: AppUtils.kPrimaryColor,
  //   scaffoldBackgroundColor: AppUtils.kContentColorLightTheme,
  //   appBarTheme: appBarTheme.copyWith(backgroundColor: AppUtils.kContentColorLightTheme),
  //   iconTheme: const IconThemeData(color: AppUtils.kContentColorDarkTheme),
  //   textTheme: GoogleFonts.interTextTheme(darkTextTheme).apply(bodyColor: AppUtils.kContentColorDarkTheme),
  //   colorScheme: const ColorScheme.dark().copyWith(
  //     primary: AppUtils.kPrimaryColor,
  //     secondary: AppUtils.kSecondaryColor,
  //     error: AppUtils.kErrorColor,
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     backgroundColor: AppUtils.kContentColorLightTheme,
  //     selectedItemColor: Colors.white70,
  //     unselectedItemColor: AppUtils.kContentColorDarkTheme.withOpacity(0.32),
  //     selectedIconTheme: const IconThemeData(color: AppUtils.kPrimaryColor),
  //     showUnselectedLabels: true,
  //   ),
  // );

  static const AppBarTheme appBarTheme = const AppBarTheme(color: Colors.transparent, elevation: 0);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: AppUtils.kPrimaryColor,
    // accentColor: kAccentLightColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      secondary: AppUtils.kSecondaryLightColor,
      background: Colors.white,
      // on light theme surface = Colors.white by default
    ),
    // backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: AppUtils.kBodyTextColorLight),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: AppUtils.kAccentIconLightColor,
    ),
    primaryIconTheme: const IconThemeData(color: AppUtils.kPrimaryIconLightColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyLarge: const TextStyle(color: AppUtils.kBodyTextColorLight),
      bodyMedium: const TextStyle(color: AppUtils.kBodyTextColorLight),
      headlineMedium:
      const TextStyle(color: AppUtils.kTitleTextLightColor, fontSize: 32),
      displayLarge: const TextStyle(color: AppUtils.kTitleTextLightColor, fontSize: 80),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppUtils.kPrimaryColor,
    // accentColor: kAccentDarkColor,
    scaffoldBackgroundColor: const Color(0xFF0D0C0E),
    appBarTheme: appBarTheme,
    colorScheme: const ColorScheme.light(
      secondary: AppUtils.kSecondaryDarkColor,
      surface: AppUtils.kSurfaceDarkColor,
      background: AppUtils.kBackgroundDarkColor,
    ),
    iconTheme: const IconThemeData(color: AppUtils.kBodyTextColorDark),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: AppUtils.kAccentIconDarkColor,
    ),
    primaryIconTheme: const IconThemeData(color: AppUtils.kPrimaryIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyLarge: const TextStyle(color: AppUtils.kBodyTextColorDark),
      bodyMedium: const TextStyle(color: AppUtils.kBodyTextColorDark),
      headlineMedium: const TextStyle(color: AppUtils.kTitleTextDarkColor, fontSize: 32),
      displayLarge: const TextStyle(color: AppUtils.kTitleTextDarkColor, fontSize: 80),
    ),
  );
}
