import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/size.dart';
import 'package:get/get.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: TColors.grey)),
            child: IconButton(

              icon: const Image(
                  height: TSizes.iconMd,
                  width: TSizes.iconMd,
                  image: AssetImage(TImages.google)),
              onPressed: () {  },
            )

        ),
        const   SizedBox(width: TSizes.spaceBtwItems,),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: TColors.grey)),
            child: IconButton(

              icon: const Image(
                  height: TSizes.iconMd,
                  width: TSizes.iconMd,
                  image: AssetImage(TImages.facebook)),
              onPressed: () {  },
            )

        )
      ],
    );
  }
}