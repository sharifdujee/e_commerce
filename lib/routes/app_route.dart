import 'package:business_app/features/authentication/presentation/screen/login_screen.dart';
import 'package:business_app/features/nav_bar/presentation/screen/navbar.dart';
import 'package:business_app/features/splash/presentation/screen/splash_screen.dart';
import 'package:get/get.dart';

import '../features/onboarding/presentation/screen/onboarding_screen.dart';

class AppRoute{
  AppRoute._();
  static const String init = "/";

  static List<GetPage> routes = [
    GetPage(name: init, page: ()=>SplashScreen()),
    GetPage(name: LoginScreen.routeName, page: ()=>LoginScreen()),
    GetPage(name: BottomNavBarScreen.routeName, page: ()=>BottomNavBarScreen()),
    GetPage(name: OnBoardingPage.routeName, page: ()=>OnBoardingPage()),
    
  ];

}