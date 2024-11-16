import 'dart:async';

import 'package:e_commerce_app/common/widget/success/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/texts.dart';

class VerifyEmailController extends GetxController{

  static VerifyEmailController get instance => Get.find();
  ///send email and redirect
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sendEMailVerification();
    setTimerForAutoRedirect();
  }

  ///send email verification
sendEMailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoader.successSnackBar(title: 'Email sent', message: 'Please check your inbox to verify email');

    }
    catch(e){
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
}

/// set Time
 setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified?? false){
        timer.cancel();
        Get.off(()=>SuccessScreen(image: TImages.successAnimation, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubtitle, onPressed: ()=>AuthenticationRepository.instance.screenRedirect()));
      }

    });
 }

 checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser!=null && currentUser.emailVerified){
      Get.off(()=>SuccessScreen(image: TImages.successAnimation, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubtitle, onPressed: ()=>AuthenticationRepository.instance.screenRedirect));

    }
 }
}