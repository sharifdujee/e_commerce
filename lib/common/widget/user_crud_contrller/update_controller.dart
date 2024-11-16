import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/controller/user_controller/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_commerce_app/utils/helpers/full_screen_loader.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants/images_strings.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository  = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();

  }

  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName()async{
    try{
      TFullScreenLoader.openLoadingDialog('We are updating your information', TImages.pencilAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      /// form validation
      if(!updateUserNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {"firstName": firstName.text.trim(), 'lastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);
       /// update Rx value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      TFullScreenLoader.stopLoading();
      TLoader.successSnackBar(title: 'Congratulations', message: 'your name has been updated');


      /// Move previous screen
      Get.off(()=> const ProfileScreen());

    }
    catch(e){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    }

  }


}