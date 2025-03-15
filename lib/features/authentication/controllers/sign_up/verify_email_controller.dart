import 'package:e_commerce/common/widgets/widgets_login_signup/Success/success_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import '../../../../data/repositries/authentication/authentication_repositry.dart';
class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();
  
  //Send email when verify email screen appears and set timer to redirect
@override
  void onInit() {
    // TODO: implement onInit
 // sendEmailVerification();
  setTimeForAutoRedirect();
  super.onInit();
  }

  ///Send email verification link
// Future<void> sendEmailVerification() async{
//   try{
//     await AuthenticationRepository.instance.sendEmailVerification();
//     TLoaders.successSnackBar(title: 'Email send', message: 'please check your inbox amd verify email');
//
//   } catch(e){
//     TLoaders.errorSnackBar(title: 'h snap!', message: e.toString());
//   }
// }

///Timer to auto redirect on verify email verification
  void setTimeForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      // Adjusted duration to 5 seconds
      // Get the current user
      final user = Supabase.instance.client.auth.currentUser;

      if (user != null) {
        // Refresh the user session to check for updates (optional)
        await Supabase.instance.client.auth.refreshSession();

        // Check if the user's email is verified
        if (user.emailConfirmedAt != null) {
          timer.cancel(); // Stop the timer once the email is verified

          // Navigate to the success screen
          Get.off(() => SuccessScreen(
            title: TTexts.username,
            image: TImages.banner1,
            subTitle: TTexts.username,
            onPressed: AuthenticationRepository.instance.screenRedirect(),
          ));
        }
      } else {
        // Handle the case when no user is logged in
        print("No user session found.");
        timer.cancel(); // Cancel the timer if no user is found
      }
    });
  }



  ///Manually check if email verified
Future<void> checkEmailVerificationStatus() async {
  final currentUser = Supabase.instance.client.auth.currentUser;

  if (currentUser != null) {
    // Fetch the latest user session from Supabase to check verification status
    await Supabase.instance.client.auth.refreshSession();
    final updatedUser = Supabase.instance.client.auth.currentUser;

    if (updatedUser != null && updatedUser.emailConfirmedAt != null) {
      Get.off(() => SuccessScreen(
        title: TTexts.username,
        image: TImages.banner1,
        subTitle: TTexts.username,
        onPressed: AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }
}

}