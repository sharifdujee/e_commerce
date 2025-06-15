import 'package:business_app/core/utils/app_color.dart';
import 'package:business_app/core/utils/constants/app_sizer.dart';
import 'package:business_app/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
   final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Text("Beauty", style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 100.sp,
          color: AppColor.textWhite,

        ),),
      ),
      
    );
    
  }
}
