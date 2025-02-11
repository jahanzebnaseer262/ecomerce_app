
import 'package:e_commerce/features/authentication/screens/signup.widgets/signup_form.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/widgets/widgets_login_signup/form_divider.dart';
import '../../../../common/widgets/widgets_login_signup/social_buttons.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark= THelperFunctions.isDarkMode(context);
     return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(TTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium,),
const SizedBox(height: TSizes.spaceBtwSections,),
              //Form
             const  TSignUpForm(),
const SizedBox(height: TSizes.spaceBtwSections,),
              // SizedBox(width: double.infinity, child: ElevatedButton(
              //   onPressed: (){},
              //   child: const Text(TTexts.createAccount),
              //
              // ),),
              FormDivider(text: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections,),
            const  TSocialButton()
            ],
          ),
        ),



      ),
    );
  }
}


