import 'package:e_commerce/data/repositries/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/signup.widgets/verify_email.dart';
import 'package:e_commerce/user_model.dart';
import 'package:e_commerce/utils/network_manager/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositries/authentication/authentication_repositry.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///variables
  final hidePassword = true.obs; //observable for hiding/showing password
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final userName = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///SignUp
  Future<void> signUp() async {
    final instance = Get.put(NetworkManager());
    try {
      //try loading
      print("Loading screen should appear now...");
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information...',
          'assets/images/animations/141594-animation-of-docer.json');

//check Network connectivity
      final isConnected = await instance.isConnected();
      print("Internet status: $isConnected");
      if (!isConnected) {
        print("No internet, stopping sign-up process.");
        //Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }
//form validation
      if (!signupFormKey.currentState!.validate()) {
        //Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //privacyPolicy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept privacy policy',
            message:
                'In order to create account you have to accept privacy policy');
        TFullScreenLoader.stopLoading();
      }

      // //Register user in the supabase authentication and save details
      // final userCredential = await AuthenticationRepository.instance.signUpUser(
      //   email: email.text.trim(),
      //   password: password.text.trim(),
      // );
      //
      // if (userCredential == null || userCredential.user == null) {
      //   TFullScreenLoader.stopLoading();
      //   TLoaders.errorSnackBar(title: 'Sign Up Failed', message: 'Unable to create user.');
      //   return;
      // }

// ✅ Correct way to get user ID
      final String? userId = await AuthenticationRepository.instance.signUpUser(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (userId == null) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Sign Up Failed', message: 'Unable to create user.');
        return;
      }

// ✅ Directly use `userId`
      final newUser = UserModel(
        id: userId,
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        profilePicture: '',
      );

// ✅ Save to Supabase
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);



      //RemoveLoader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congargulations',
      message: 'your account has created, verify your email',
      );

      Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      //Remove loader
      TFullScreenLoader.stopLoading();
//show some generic error to the user
      TLoaders.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  }
}


