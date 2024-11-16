import 'package:e_commerce_app/features/authentation/controller/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppbarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(onPressed: (){
          OnboardingController.instance.skipPage();
        }, child: const Text('Skip')));
  }
}