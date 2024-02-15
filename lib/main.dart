import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/UserView.dart';
import 'package:myapp/ui/auth/screens/login_screen.dart';
import 'package:myapp/utils/routes/pages.dart';
import 'package:myapp/utils/routes/routes.dart';
import 'binding/MyBinding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Screen Responsiveness
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return  GetMaterialApp(
          title: 'My App with Getx State Management',
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          //   useMaterial3: true,
          //   fontFamily: 'Poppins',
          // ),
          theme: ThemeData(),
          getPages: Pages.list,
          initialRoute: Routes.loginScreen,
          initialBinding: MyBinding(),
          home: LoginScreen(),
        );
      },
    );
  }
}