import 'package:e_commerce/common/styles/spacing_styles.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/widgets_login_signup/form_divider.dart';
import '../../../../common/widgets_login_signup/social_buttons.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/constants/text_strings.dart';
import '../login_widgets/login_form.dart';
import '../login_widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //check with bool
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo ,title and subtitle
              TLoginHeader(dark: dark),
              //Form
              const LoginForm(),
//Divider
              FormDivider(text:TTexts.orSignInWith.capitalize!),
              const   SizedBox(width: TSizes.spaceBtwSections,),
              //Footer
         const     TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}










