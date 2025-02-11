import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();

  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final deviceStorage = GetStorage();
      if (deviceStorage.read('isFirstTime') != false) { // Only update if needed
        deviceStorage.write('isFirstTime', false);
      }
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration:
        const Duration(milliseconds: 300), // Adjust the duration as needed
        curve: Curves.easeInOut, // Adjust the animation curve if desired
      );
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    if (currentPageIndex.value == 2) {
      final deviceStorage = GetStorage();
      if (deviceStorage.read('isFirstTime') != false) { // Only update if needed
        deviceStorage.write('isFirstTime', false);
      }
      Get.offAll(() => const LoginScreen());
    }
  }
}



