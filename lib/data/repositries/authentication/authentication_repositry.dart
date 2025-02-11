import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/onboarding_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();

  ///called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///Function to show relevant screen
  screenRedirect() async {
    //local storage
    if (deviceStorage.read('isFirstTime') == null) {
      deviceStorage.write('isFirstTime', true);
    }

    deviceStorage.read("isFirstTime") != true
        ? Get.offAll(const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }
}
