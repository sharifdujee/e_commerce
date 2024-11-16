import 'package:e_commerce_app/features/authentation/screens/onboarding/widget/onboardingNavigation.dart';
import 'package:e_commerce_app/features/authentation/screens/onboarding/widget/onboarding_next_button.dart';
import 'package:e_commerce_app/features/authentation/screens/onboarding/widget/onboarding_page.dart';
import 'package:e_commerce_app/features/authentation/screens/onboarding/widget/onboarding_skip.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// horizontally scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onboardingTitle1,
                subTitle: TTexts.onboardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onboardingTitle2,
                subTitle: TTexts.onboardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onboardingTitle3,
                subTitle: TTexts.onboardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot navigation
          const OnBoardingNavigation(),
          
          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}






