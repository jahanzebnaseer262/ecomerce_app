import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/size.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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