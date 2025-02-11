import 'package:e_commerce/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/utils/constants/size.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
class TOrderList extends StatelessWidget {
  const TOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index)=> TCircularContainer(
        radius: 30,
        showBorder: true,
        backGroundColor: darkMode? TColors.dark: TColors.white,
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                //1. Icon
       const Icon(Iconsax.ship),
             const    SizedBox(width: TSizes.spaceBtwItems/2,),

                //2, status & date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text('29 Jan, 2025', style: Theme.of(context).textTheme.headlineSmall,)
                    ],
                  ),
                ),
                //3. Icon
                IconButton(onPressed: (){},
                    icon: const Icon(Iconsax.arrow_right_31, size: TSizes.iconSm,))
              ],
            ),
       const     SizedBox(height: TSizes.spaceBtwItems),
           // Row2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      //1. Icon
                      const Icon(Iconsax.ship),
                      const    SizedBox(width: TSizes.spaceBtwItems/2,),

                      //2, status & date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium,)
                          ],
                        ),
                      ),
                      //3. Icon

                    ],
                  ),
                ),
                //Row 3
                Expanded(
                  child: Row(
                    children: [
                      //1. Icon
                      const Icon(Iconsax.calendar),
                      const    SizedBox(width: TSizes.spaceBtwItems/2,),

                      //2, status & date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('29 Jan, 2025', style: Theme.of(context).textTheme.titleMedium,)
                          ],
                        ),
                      ),
                      //3. Icon

                    ],
                  ),
                ),
              ],
            ),
            //Row2

          ],
        ),
      ), separatorBuilder: (BuildContext context, int index) {
      return  const SizedBox(height: TSizes.spaceBtwItems,);
    },
    );
  }
}
