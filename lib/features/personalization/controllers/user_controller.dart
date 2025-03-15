import 'dart:async';

import 'package:e_commerce/data/repositries/authentication/authentication_repositry.dart';
import 'package:e_commerce/data/repositries/user/user_repository.dart';
import 'package:e_commerce/user_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../utils/constants/size.dart';
class UserController extends GetxController{
  static UserController get instance=> Get.find();
  Rx<UserModel> user= UserModel.empty().obs;
  final userRepository= Get.put(UserRepository());

final verifyEmail= TextEditingController();
  final password= TextEditingController();
  final hidePassword= true.obs;
  GlobalKey<FormState> reAuthFormKey= GlobalKey<FormState>();

  final supaBase = Supabase.instance.client;



  @override
  void onInit() {
    super.onInit();

    fetchUserRecord();
  }


  // Future<void> saveUserRecord() async {
  //   try {
  //     final supabase = Supabase.instance.client;
  //     final user = supabase.auth.currentUser;
  //
  //     if (user == null) {
  //       TLoaders.warningSnackBar(
  //         title: 'User not found',
  //         message: 'Please log in before saving your information.',
  //       );
  //       return;
  //     }
  //
  //    // final nameParts= UserModel.nameParts(user.)
  //
  //     // Define user data
  //     final userData = UserModel(
  //         id: user.id,
  //         username: user.,
  //         email: email,
  //         phoneNumber: phoneNumber,
  //         firstName: firstName,
  //         lastName: lastName,
  //         profilePicture: profilePicture){
  //
  //     };
  //
  //     // Insert or update the user record
  //     final response = await supabase
  //         .from('users')
  //         .upsert([userData], onConflict: ['id']);
  //
  //     // Check if the request was successful
  //     if (response == null) {
  //       TLoaders.warningSnackBar(
  //         title: 'Data not saved',
  //         message: 'Something went wrong while saving your information. Try again.',
  //       );
  //     } else {
  //       TLoaders.successSnackBar(
  //         title: 'Success',
  //         message: 'Your information has been saved successfully!',
  //       );
  //     }
  //   } catch (e) {
  //     TLoaders.warningSnackBar(
  //       title: 'Error',
  //       message: 'Something went wrong while saving your information. Please try again.',
  //     );
  //   }
  // }

Future<void> fetchUserRecord() async{
  try{
    final id= supaBase.auth.currentUser?.id;
final user= userRepository.fetchUserDetails(id!);
this.user(await user);
  }catch(e){
    user(UserModel.empty());
  }
}

//delete account warning pop up
Future deleteAccountWarningPopUp(){
    return Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account',
      confirm: ElevatedButton(
          onPressed: ()async =>deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side:const BorderSide(color: Colors.red)),

          child: Padding(
            padding: const EdgeInsets.all(TSizes.lg),
            child: Text('Delete'),
          )),
      cancel: OutlinedButton(
          onPressed: ()=>Navigator.of(Get.overlayContext!).pop(),
          child: Text('Cancel'))
    );
}


void deleteUserAccount() async {
  ///First reAuthenticate user
  final auth = AuthenticationRepository.instance;
  final provider = supaBase.auth.currentSession?.user.appMetadata['provider'];

  if (provider != null) {
    // If user signed in using Google
    if (provider == 'google') {
      await supaBase.auth.signInWithOAuth(provider.google);
      print("Re-authenticating with Google...");
      final userId = supaBase.auth.currentUser?.id;
      await supaBase.auth.admin.deleteUser(userId!);
      print('✅ User deleted from authentication!');
      //await supaBase.auth.de
    }
    // If user signed in using Email & Password
    else if (provider == 'email') {
      await supaBase.auth.signInWithOtp(
        email: supaBase.auth.currentUser!.email!,
        shouldCreateUser: false, // Ensures it's only for existing users
      );
      print("Re-verification email sent!");
      if (supaBase.auth.currentUser?.emailConfirmedAt != null) {
        final userId = supaBase.auth.currentUser?.id;
        await supaBase.auth.admin.deleteUser(userId!);
        print('✅ User deleted from authentication!');
      } else {
        print('email id not verified yet');
      }
    }
  }
}

  var imageUrl = RxString('');

  Future<void> pickAndUploadImage() async {
    try {
      // Pick Image
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true, // Ensure binary data is available
      );

      if (result == null) return; // User canceled

      // Get file name & bytes
      final fileBytes = result.files.single.bytes;
      final fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}.jpeg';

      if (fileBytes == null) {
        Get.snackbar("Error", "Failed to read image data");
        return;
      }

      // ✅ Upload the file to Supabase Storage
      await supaBase.storage.from('uploads').uploadBinary(
        fileName,
        fileBytes,
        fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
      );

      // ✅ Get Public URL AFTER uploading
      String publicUrl = supaBase.storage.from('uploads').getPublicUrl(fileName);

      // ✅ Save the URL to Supabase Table
      Map<String, dynamic> json = {'profilePicture': publicUrl};

      final id = supaBase.auth.currentUser?.id;
      if (id != null) {
        await userRepository.updateSingleField(id, json);
      }

      // ✅ Update local state
      user.value.profilePicture = publicUrl;

      Get.snackbar("Success", "Image uploaded successfully!");
    } catch (e) {
      Get.snackbar("Error", "Upload failed: $e");
      print("supabase excepetion: $e");
    }
  }





}