import 'package:business_app/core/bindings/controller_binder.dart';
import 'package:business_app/core/utils/constants/app_size.dart';
import 'package:business_app/core/utils/theme/theme.dart';
import 'package:business_app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    AppSizes().init(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.init,
      initialBinding: ControllerBinder(),
      getPages: AppRoute.routes,
      theme: AppTheme.lightTheme,

    );
  }
}
