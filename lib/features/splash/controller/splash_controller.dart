import 'package:business_app/features/authentication/presentation/screen/login_screen.dart';
import 'package:business_app/features/nav_bar/presentation/screen/navbar.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    navigateToLoginScreen();
    super.onInit();
  }
   void navigateToLoginScreen(){
     Future.delayed(Duration(microseconds: 300),(){
       Get.offAllNamed(BottomNavBarScreen.routeName);
     });
   }
}