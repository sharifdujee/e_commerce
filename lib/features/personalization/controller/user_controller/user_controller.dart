import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/update_user_info/reauth_login_form.dart';
import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentation/model/user/user_model.dart';
import 'package:e_commerce_app/features/authentation/screens/login/login_screen.dart';
import 'package:e_commerce_app/utils/helpers/full_screen_loader.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/exception_Handler/firebase_exception.dart';
import '../../../../utils/helpers/exception_Handler/format_exception.dart';
import '../../../../utils/helpers/exception_Handler/platform_exception.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey =  GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
    //deleteAccountWarningPopUp();
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      /// refresh user record
      await fetchUserRecord();
      if(user.value.id.isEmpty){
        if (userCredential != null) {
          /// convert display name
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUserName(userCredential.user!.displayName ?? '');


          /// Map Data
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
              username: userName,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');
          await userRepository.saveUserRecord(user);
        }
      }


    } on FirebaseException catch (e) {
      //print('error1${(e.code)} ');
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      //print('error2${(e.code)} ');

      throw TargetPlatformException(e.code).message;
    } catch (e) {
      TLoader.warningSnackBar(
          title: 'Data not Saved',
          message:
              'Something went wrong while saving your information, You can re-save your data in your profile');
    }
  }

  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);


    }
    catch(e){
      user(UserModel.empty());

    }
    finally{
      profileLoading.value = false;
    }
  }
  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is irreversible and all your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text('Cancel'),
      ),
    );
  }


  void deleteUserAccount() async {
    try {
      // Open loading dialog
      TFullScreenLoader.openLoadingDialog('Processing', TImages.pencilAnimation);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider == 'google.com') {
        // For Google account, re-authenticate and delete
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        TFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());
      } else if (provider == 'password') {
        // For email/password provider, re-authenticate through ReAuthLoginForm
        TFullScreenLoader.stopLoading();
        Get.offAll(() => const ReAuthLoginForm());
      } else {
        // Handle unexpected provider
        throw Exception("Unsupported authentication provider.");
      }
    } catch (e) {
      // Stop loading and show error message
      TFullScreenLoader.stopLoading();
      TLoader.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      print('Error during account deletion: $e'); // Debugging
    }
  }


  Future<void> reAuthenticateEmailAndPassword() async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing', TImages.pencilAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      if(!reAuthFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(()=>const LoginScreen());

    }
    catch(e){
      TFullScreenLoader.stopLoading();
      TLoader.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// upload image
  uploadUserProfilePicture() async {
    try {
      imageUploading.value = true;
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile', image);

        // Update user image record
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        // Update the observable and refresh to trigger Obx
        user.value.profilePicture = imageUrl;
        user.refresh(); // Force UI update
        CachedNetworkImage.evictFromCache(imageUrl); // Optional cache clear

        TLoader.successSnackBar(title: 'Congratulations', message: 'Image uploaded successfully');
      }
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
    finally{
      imageUploading.value = false;
    }
  }


}
