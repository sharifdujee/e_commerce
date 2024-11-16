import 'package:e_commerce_app/bindings/general_binding.dart';
import 'package:e_commerce_app/features/authentation/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/route/app_routes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBinding(),
      getPages: AppRoutes.pages,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const Scaffold(
        backgroundColor: TColors.primaryColor,body: Center(child: CircularProgressIndicator(color: Colors.white,),),
      ),
    );
  }
}
