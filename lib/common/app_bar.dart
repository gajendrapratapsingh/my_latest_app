import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/theme/text_theme.dart';

AppBar buildAppBar(BuildContext context, String? title) {
  return AppBar(
    backgroundColor: AppColors.kAppBarColor,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white), // Change the icon here
      onPressed: () {
        // Add your back button logic here
        //Navigator.pop(context);
        Get.back();
      },
    ),
    title: Text(
      title ?? "Registration",
      style: AppTextTheme.kLabelStyle.copyWith(fontSize: 22.sp,color: Colors.white),
    ),
  );
}
