// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:myapp/ui/MyView.dart';
import 'package:myapp/ui/UserView.dart';
import 'routes.dart';

class Pages {
  static var list = [
    // GetPage(
    //   name: Routes.splashScreen,
    //   page: () => SplashScreen(),
    //   // binding: SplashBinding(),
    // ),
    // GetPage(
    //   name: Routes.loginScreen,
    //   page: () => LoginScreen(),
    //   // binding: SplashBinding(),
    // ),
    // GetPage(
    //   name: Routes.otpScreen,
    //   page: () => OtpScreen(),
    //   // binding: SplashBinding(),
    // ),
    GetPage(
      name: Routes.userScreen,
      page: () => UserView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.myScreen,
      page: () => MyView(),
      transition: Transition.rightToLeftWithFade,
      // binding: SplashBinding(),
    ),

  ];
}
