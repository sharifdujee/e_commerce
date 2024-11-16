import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:e_commerce_app/features/personalization/controller/user_controller/user_controller.dart';
import 'package:e_commerce_app/utils/helpers/full_screen_loader.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/constants/images_strings.dart';

class LogInController extends GetxController{

  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // TODO: implement onInit
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }


  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in', TImages.deliveredEmailIllustration);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoader.errorSnackBar(title: 'No Internet', message: 'Please check your connection.');
        return;
      }

      // Validate form
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        TLoader.errorSnackBar(title: 'Validation Error', message: 'Please check your inputs.');
        return;
      }

      // Save credentials if "Remember Me" is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Attempt login
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Navigate to NavigationMenu on successful login

      // Optional: Further handling after navigation
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //print('the login function error is ${e.toString()}');

      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Login Error', message: e.toString());
    }
  }


  /// Google sign in
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in', TImages.successAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoader.errorSnackBar(title: 'No Internet', message: 'Please check your connection.');
        return;
      }

      // Google Sign-In authentication
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredential);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect user
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh', message: 'Sign In Failed: ${e.toString()}');
    }
  }



}