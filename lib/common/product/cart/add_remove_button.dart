import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
class TProductAddRemoveButton extends StatelessWidget {
  const TProductAddRemoveButton({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: (){},
            icon: Icon(
              Iconsax.minus,
              size: TSizes.md,
              color: darkMode? TColors.white :TColors.black,
            )),
        const    SizedBox(width: TSizes.spaceBtwItems,),
        Text('2', style: Theme.of(context).textTheme.titleSmall,),
        const    SizedBox(width: TSizes.spaceBtwItems,),
        IconButton(
            onPressed: (){},
            icon: Icon(
              Iconsax.add,
              size: TSizes.md,
              color: darkMode? TColors.white :TColors.black,
            )),
      ],
    );
  }
}