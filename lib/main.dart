import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/MyView.dart';
import 'package:myapp/ui/UserView.dart';
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
    return GetMaterialApp(
      title: 'My App with Getx State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        fontFamily: 'SpecialsBirthday',
      ),
      getPages: Pages.list,
      initialRoute: Routes.userScreen,
      initialBinding: MyBinding(),
      home: UserView(),
    );
  }
}