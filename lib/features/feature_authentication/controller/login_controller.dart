import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/controller/user_controller.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/repositories/authentication_repository.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/repositories/user_repository.dart';
import 'package:e_commerce_admin_panel/model/auth/user_model.dart';
import 'package:e_commerce_admin_panel/utils/constants/images_strings.dart';
import 'package:e_commerce_admin_panel/utils/constants/texts.dart';
import 'package:e_commerce_admin_panel/utils/helper/network_manager.dart';
import 'package:e_commerce_admin_panel/utils/theme/full_screen_loader.dart';
import 'package:e_commerce_admin_panel/utils/theme/tloader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL')??'';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD')??'';
    super.onInit();

  }

  /// Login



// Login logic with debugging in emailAndPasswordSignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      //TFullScreenLoader.openLoadingDialog('Login Admin account', TImages.pencilAnimation);

      /// Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoader.errorSnackBar(title: 'Connection Error', message: 'No internet connection.');
        return;
      }

      /// Validate form
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        TLoader.errorSnackBar(title: 'Validation Error', message: 'Please enter valid email and password.');
        return;
      }

      /// Save data locally if 'Remember Me' is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      /// Attempt login
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Fetch user details to verify role
      final user = await UserController.instance.fetchUserDetails();
      TFullScreenLoader.stopLoading();

      if (user.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        TLoader.errorSnackBar(title: 'Not Authorized', message: 'You do not have admin access.');
      } else {
        print("User is authorized as admin, navigating to dashboard.");
        AuthenticationRepository.instance.screenRedirect();
        TFullScreenLoader.stopLoading();
      }
    } catch (e) {
      TLoader.errorSnackBar(title: 'Login Failed', message: e.toString());
      TFullScreenLoader.stopLoading();
    }
  }



  /// registration
  Future<void> registerAdmin() async {
   try{

     TFullScreenLoader.openLoadingDialog(
         'Register Admin account', TImages.pencilAnimation);

     ///check internet connection
     final isConnected = await NetworkManager.instance.isConnected();
     if (!isConnected) {
       TFullScreenLoader.stopLoading();
       return;
     }

     /// registration
     await AuthenticationRepository.instance.registerWithEmailAndPassword(
         TTexts.adminEmail, TTexts.adminPassword);

     /// create admin role
     final userRepository = Get.put(UserRepository());
     await userRepository.createUser(UserModel(
         id: AuthenticationRepository.instance.authUser!.uid,
         firstName: 'Md Robayet Bin',
         lastName: 'Rahat',
         role: AppRole.admin,
         email: TTexts.adminEmail,
         createAt: DateTime.now()));
     TFullScreenLoader.stopLoading();

     AuthenticationRepository.instance.screenRedirect();
   }
   catch(e){
     TFullScreenLoader.stopLoading();
     TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
   }


  }
}
