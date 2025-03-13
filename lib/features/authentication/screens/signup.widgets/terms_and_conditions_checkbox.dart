import 'package:e_commerce/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
class TTermsAndConditions extends StatelessWidget {
  const TTermsAndConditions({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark= THelperFunctions.isDarkMode(context);
    final controller= SignUpController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
              ()=> Checkbox(
                value: controller.privacyPolicy.value ,
                onChanged:(value)=>controller.privacyPolicy.value=!controller.privacyPolicy.value
            ),
          ),

        ),
        const   SizedBox(height: TSizes.spaceBtwSections,),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: TTexts.iAgreeTo,style: Theme.of(context).textTheme.bodySmall),
            //use ! after body Medium
            TextSpan(text: TTexts.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark? TColors.white : TColors.primary
            )),
            TextSpan(text: TTexts.and,style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: TTexts.termsOfUse,style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark? TColors.white : TColors.primary
            )),
          ]),

        )
      ],
    );
  }
}