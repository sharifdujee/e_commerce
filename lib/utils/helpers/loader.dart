import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class TLoader{


  static warningSnackBar({required title, message = ''}){
    Get.snackbar(title, message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: TColors.primaryColor,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2, color: Colors.white,));
  }
  static successSnackBar({required title, message = ''}){
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        icon: const Icon(Iconsax.warning_2, color: Colors.white,));
  }

  static errorSnackBar({required title, message = ''}){
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: Colors.white,));
  }

  static customToast({required message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunction.isDarkMode(Get.context!)?TColors.darkerGrey.withOpacity(0.9):TColors.grey.withOpacity(0.9)
          ),
          child: Center(
            child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge,),
          ),

        )));
  }


}