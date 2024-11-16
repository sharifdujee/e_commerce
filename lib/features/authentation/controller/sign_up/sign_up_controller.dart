import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentation/model/user/user_model.dart';
import 'package:e_commerce_app/features/authentation/screens/sign_up/verify_email.dart';
import 'package:e_commerce_app/utils/helpers/full_screen_loader.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_strings.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// variable
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;

  void signUp() async {
    try {
      /// loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.successAnimation);

      /// check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///check privacy policy
      if (!privacyPolicy.value) {
        TLoader.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the privacy policy and terms of use');

        return;
      }

      /// user registration
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      ///save data
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          password: password.text.trim(),
          profilePicture: 'profilePicture');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      TFullScreenLoader.stopLoading();
      TLoader.successSnackBar(title: 'Congratulations', message: 'your account has been created! verify email to continue');
      Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      //TFullScreenLoader.stopLoading();
    } finally {
     // TFullScreenLoader.stopLoading();
    }
  }
}
