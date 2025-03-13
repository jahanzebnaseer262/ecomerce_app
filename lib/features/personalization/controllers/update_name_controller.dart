import 'package:e_commerce/data/repositries/user/user_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_commerce/utils/network_manager/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../utils/constants/image_strings.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get _instance => Get.find();

  final supaBase= Supabase.instance.client;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    initializeNames();
  } //Fetch userRecord

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'we are updating your information', TImages.dockerAnimation);
      //check internet Connnectivity

      final isCnnected = await NetworkManager.instance.isConnected();
      if (!isCnnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form valiadtion
      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      final id= supaBase.auth.currentUser?.id;

      userRepository.updateUserDetails(id!, name);

      //update names
      userController.user.value.firstName= firstName.text.trim();
      userController.user.value.lastName= lastName.text.trim();

      //stop loading
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(title: 'Congragulations',message: 'Your name has been updated');

      //Go back to profile screen
      Get.off(()=>ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh snap!', message: e.toString());
    }
  }
}
