import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/localizations/languages.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/theme/custom_theme_data.dart';
import 'package:myapp/ui/auth/screens/login_screen.dart';
import 'package:myapp/utils/routes/pages.dart';
import 'package:myapp/utils/routes/routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'binding/MyBinding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('myAppBox');
  await initPreferences();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
     runApp(MyApp());
  });
}

Future<void> initPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLanguage = prefs.getString('language');
  print("savelng $savedLanguage");
  if(savedLanguage != null) {
    //Get.updateLocale(Locale(savedLanguage));
    if(savedLanguage == "en") {
      print("savelng1 $savedLanguage");
      Get.updateLocale(const Locale('en', 'US'));
    }
    else{
      print("savelng2 $savedLanguage");
      Get.updateLocale(const Locale('hi', 'IN'));
    }
  }
  else
    print("savelng3 $savedLanguage");
    Get.updateLocale(const Locale('en', 'US'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //appID: 1520639563,
  //appSign: "ad39fc999631dcc983e538dca1662d35c8059a0bdeb5bcaa0f935fa298f3cfac",

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Screen Responsiveness
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return GetMaterialApp(
          title: 'My App with Getx State Management',
          debugShowCheckedModeBanner: false,
          translations: Languages(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          // theme: ThemeData(
          //   colorScheme: ColorScheme.light(onPrimary: AppColors.kAppBarColor),
          //   useMaterial3: true,
          //   fontFamily: 'Poppins',
          // ),
          //theme: CustomTheme.lightTheme,
          theme: CustomTheme.lightTheme, // Use default theme initially
          darkTheme: CustomTheme.darkTheme,
          themeMode: ThemeMode.system, // Use system theme initially
          // theme: ThemeData.light(), // Use default theme initially
          // darkTheme: ThemeData.dark(),
          // themeMode: ThemeMode.system, // Use system theme initially
          getPages: Pages.list,
          initialRoute: Routes.splashScreen,
          initialBinding: MyBinding(),
          //home: const LoginScreen(),
        );
      },
    );
  }
}