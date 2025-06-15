
import 'package:business_app/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../../data/onboarding_data_model.dart';


class OnBoardingPage extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());
  static const String routeName = "/onboarding";

  final List<OnboardingInfo> pages = [
    OnboardingInfo(
      image: ImagePath.onBoardingImage,
      title: 'Easy Away to Get\nYour Beauty Product',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fringilla in sed risus sit.',
    ),
    OnboardingInfo(
      image: ImagePath.onBoardingImage,
      title: 'Fast Delivery\nTo Your Home',
      description: 'We ensure fast and safe delivery of your products.',
    ),
    OnboardingInfo(
      image: ImagePath.onBoardingImage,
      title: 'Quality Products\nAt Best Prices',
      description: 'Get authentic beauty items at unbeatable prices.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          final page = pages[controller.currentIndex.value];
          return Column(
            children: [
              // Skip
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: controller.skip,
                      child: Row(
                        children: const [
                          Text("Skip",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold)),
                          Icon(Icons.arrow_forward, color: Colors.pink),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Image
              Expanded(
                child: Image.asset(page.image, fit: BoxFit.contain),
              ),

              // Bottom section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Column(
                  children: [
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      page.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(controller.currentIndex.value == 2
                            ? 'Get Started'
                            : 'Next'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Dot Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                            (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: controller.currentIndex.value == index
                              ? 16
                              : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.currentIndex.value == index
                                ? Colors.pink
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
