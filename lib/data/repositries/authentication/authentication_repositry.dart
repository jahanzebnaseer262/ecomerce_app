import 'package:e_commerce/features/authentication/screens/bottom_navigation.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/onboarding_screen.dart';
import 'package:e_commerce/features/authentication/screens/signup.widgets/verify_email.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final supaBase = Supabase.instance.client;

  ///called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///Function to show relevant screen
  screenRedirect() async {
 final session= supaBase.auth.currentSession;

    if (session != null) {

        Get.offAll(() => const NavigationMenu());

    } else if(session==null){
      Get.offAll(() => const VerifyEmailScreen());
    }
    else if(deviceStorage.read('isFirstTime') == null){

        deviceStorage.write('isFirstTime', true);


      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  //local storage

  //Email and password sign in
  ///Email Authentication-- Signin
  ///Email Authentication-- Registration
  Future<String?> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await supaBase.auth.signUp(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        print("❌ User sign-up failed. No user returned.");
        return null;
      }

      // ✅ Get the User ID
      final userId = userCredential.user?.id ??
          Supabase.instance.client.auth.currentUser?.id;
      print("✅ User signed up successfully. User ID: $userId");

      return userId; // Return user ID
    } on AuthException catch (e) {
      print('❌ AuthException: ${e.message}');
      return null;
    } catch (e) {
      print('❌ Unexpected Error: $e');
      return null;
    }
  }

  ///Email verification
  // Future<void> sendEmailVerification() async {
  //   try {
  //     final user = supaBase.auth.currentUser;
  //
  //     if (user == null) {
  //       print('❌ No user is logged in.');
  //       return;
  //     }
  //
  //     await supaBase.auth.signInWithOtp(email: user.email);
  //
  //     print('✅ Verification email sent successfully!');
  //   } on AuthException catch (e) {
  //     print('❌ AuthException: ${e.message}');
  //   } catch (e) {
  //     print('❌ Unexpected Error: $e');
  //   }
  // }

  ///Signin with email and password
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        print('✅ User logged in successfully!');

        // Check if email is verified using emailConfirmedAt
        if (user.emailConfirmedAt != null) {
          print('✅ Email is verified.');
          Get.offAll(() => const NavigationMenu()); // Navigate to HomeScreen
        } else {
          print('⚠️ Email is not verified. Prompt user to verify.');
        }
      } else {
        print('❌ Login failed. No user found.');
      }
    } on AuthException catch (e) {
      print('❌ AuthException: ${e.message}');
    } catch (e) {
      print('❌ Unexpected Error: $e');
    }
  }


  ///[Logout]3
  Future<void> logOut() async {
    try {
      await Supabase.instance.client.auth.signOut();
      print('✅ User logged out successfully!');

      // Navigate to login screen after logout (optional)
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      print('❌ Error logging out: $e');
    }
  }

  /* federated identity and social sign in*/

  ///Google Authentication

  Future<void> googleSignInWithSupabase() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        print('❌ Google Sign-In canceled by user');
        return;
      }

      // Obtain the authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      // Sign in with Supabase using Google credentials
      final response = await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
        accessToken: googleAuth.accessToken!,
      );

      if (response.user != null) {
        print('✅ Signed in successfully: ${response.user?.email}');
      } else {
        print('❌ Sign-in failed');
      }
    } catch (e) {
      if (kDebugMode) print('❌ Error: $e');
    }
  }
}
