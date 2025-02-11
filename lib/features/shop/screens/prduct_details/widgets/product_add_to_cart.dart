import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/size.dart';
class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace/2),
          decoration: BoxDecoration(
        color: darkMode? TColors.darkerGrey :TColors.light,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusLg),
              topRight: Radius.circular(TSizes.cardRadiusLg),
            )
    ),
   child:   Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
Row(
  children: [
    const Icon(
      Iconsax.minus,
      color: Colors.white,
    ),
   const SizedBox(width: TSizes.spaceBtwItems,),
    Text('2',style: Theme.of(context).textTheme.titleSmall,),
    const SizedBox(width: TSizes.spaceBtwItems,),
    const Icon(
      Iconsax.add,
      color: Colors.white,
    ),
  ],
),
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black)
              ),
              child: const Text('Add to Cart'))
        ],
      )
    );
  }

}
