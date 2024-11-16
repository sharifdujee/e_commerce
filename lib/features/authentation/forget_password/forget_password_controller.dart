import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:e_commerce_app/features/authentation/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_app/utils/helpers/full_screen_loader.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants/images_strings.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      // Open loading dialog
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', TImages.pencilAnimation);

      // Check network connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoader.errorSnackBar(
            title: 'Network Error',
            message: 'No internet connection. Please try again later.');
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return; // Stop further actions if validation fails
      }

      // Attempt to send the reset email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      TFullScreenLoader.stopLoading();

      // Success message
      TLoader.successSnackBar(
          title: 'Email Sent',
          message: 'An email link has been sent to reset your password.');

      // Navigate to ResetPassword screen
      Get.to(() => ResetPassword(
        email: email.text.trim(),
      ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      print("Error: $e");

      // Show error message if something went wrong
      TLoader.errorSnackBar(
          title: 'Error', message: 'Failed to send password reset email.');
    }
  }


  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', TImages.successAnimation);
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      TFullScreenLoader.stopLoading();
      TLoader.successSnackBar(
          title: 'Email sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      // Add your password reset email logic here
    } catch (e) {
      TFullScreenLoader.stopLoading();
      print("Error: $e");
    }
  }
}
