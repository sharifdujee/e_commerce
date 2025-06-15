
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  void nextPage() {
    if (currentIndex.value < 2) {
      currentIndex.value++;
    } else {
      Get.offAllNamed('/navBar'); // Or your final destination
    }
  }

  void skip() {
    Get.offAllNamed('/navBar');
  }
}
