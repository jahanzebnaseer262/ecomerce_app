import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/validators/validation.dart';

class ReAuthenticateLoginForm extends StatelessWidget {
  const ReAuthenticateLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Re_Authenticate user'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value)=>TValidator.validateEmail(value),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      label: Text('Enter your email')),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields,),
                Obx(
                  ()=> TextFormField(
                    controller: controller.password,
                    validator: (value)=>TValidator.validatePassword(value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        label: Text(TTexts.password),
                    suffixIcon: IconButton(
                        onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,
                        icon: Icon(Iconsax.eye_slash))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
