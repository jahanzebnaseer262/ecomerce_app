import 'package:e_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/constants/text_strings.dart';
 class ForgotPassword extends StatelessWidget {
   const ForgotPassword({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(),
       body:  Padding(
         padding:  const EdgeInsets.all(TSizes.defaultSpace),
         child: Column(
           children: [
             //texts
Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
          const    SizedBox(height: TSizes.spaceBtwItems,),
             Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
           const  SizedBox(height: TSizes.spaceBtwSections*2,),
             //text field
TextFormField(
  decoration: const InputDecoration(
labelText: TTexts.email,
    prefixIcon: Icon(Iconsax.direct_right)
  ),
),
             const  SizedBox(height: TSizes.spaceBtwSections),
             SizedBox(width: double.infinity,
             child: ElevatedButton(
               onPressed: ()=>  Get.to(const ResetPassword()),
               child: const Text(TTexts.submit),
             ),
             )
           ],
         ),
       ),
     );
   }
 }
