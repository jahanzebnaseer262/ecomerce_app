import 'package:e_commerce/data/repositries/authentication/authentication_repositry.dart';
import 'package:e_commerce/utils/network_manager/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class LoginController extends GetxController{
  static LoginController get instance=> Get.find();

  GlobalKey<FormState> loginFormKey= GlobalKey<FormState>();
  final rememberMe= true.obs;
  final hidePassword= true.obs;
  final email= TextEditingController();
  final password= TextEditingController();
  final localStorage= GetStorage();

  Future<void> emailAndPasswordSignIn() async{
    try{
      //start loading
      TFullScreenLoader.openLoadingDialog('logging you in..','assets/images/animations/141594-animation-of-docer.json' );

      final  isConnected= await NetworkManager.instance.isConnected();
      if(!isConnected){
TFullScreenLoader.stopLoading();
return;
      }

      //Form Validation
      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me is selected
      if(rememberMe.value){
        localStorage.write('Remember-me-Email', email.text.trim());
        localStorage.write('Remember-me-Password', password.text.trim());
      }

      await AuthenticationRepository.instance.logInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim());

//stop loading
    TFullScreenLoader.stopLoading();

    //Redirect
AuthenticationRepository.instance.screenRedirect();
    } catch(e){
      TLoaders.errorSnackBar(title: 'oh snap!', message:
      e.toString());
    }
  }

  ///Google Sign in
// Future<void> googleSignIn() async{
//     try{
//       //start loading
//       TFullScreenLoader.openLoadingDialog('Logging you in', 'assets/images/animations/141594-animation-of-docer.json');
//
//       //check internet connectivity
//       final isConnected= await NetworkManager.instance.isConnected();
//       if(!isConnected){
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//       final userCredential=await AuthenticationRepository.instance.googleSignInWithSupabase();
//
//
//
//
//     } catch
// }
}