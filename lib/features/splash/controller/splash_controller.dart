
import 'package:get/get.dart';

import '../../onboarding/presentation/screen/onboarding_screen.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    navigateToLoginScreen();
    super.onInit();
  }
   void navigateToLoginScreen(){
     Future.delayed(Duration(microseconds: 300),(){
       Get.offAllNamed(OnBoardingPage.routeName);
     });
   }
}