import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/SplashController.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Stack(
           alignment: Alignment.center,
           children: [
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 ClipOval(child: Image.asset('assets/images/logo.jpg', height: 250.h,fit: BoxFit.cover)),
                 const SizedBox(height: 10),
                 const CircularProgressIndicator(color: Colors.green)
               ],
             ),
             const Positioned(bottom: 10, child: Text("Published by RGS Technology", textAlign: TextAlign.center))
           ],
         ),
       ),
    );
  }
}
