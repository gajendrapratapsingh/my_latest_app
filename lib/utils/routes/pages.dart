import 'package:get/get.dart';
import 'package:myapp/ui/MyView.dart';
import 'package:myapp/ui/UserView.dart';
import 'package:myapp/ui/auth/screens/login_screen.dart';
import 'package:myapp/ui/auth/screens/register_screen.dart';
import 'package:myapp/ui/splashscreen.dart';
import 'routes.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
    ),
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
