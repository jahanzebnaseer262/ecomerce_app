import 'package:e_commerce/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price.dart';
import 'package:e_commerce/common/widgets/texts/product_title_texts.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/chips/TChoiceChips.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        //Selected Attributes prices and description
        TCircularContainer(
backGroundColor: darkMode ? TColors.darkerGrey :TColors.white,
          padding:const EdgeInsets.all(TSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title, price and stock status
              Row(
                children: [
           const      TSectionHeading(
                   text: 'Variations', showActionButton: false,),
            const      SizedBox(width: TSizes.spaceBtwItems,),
             const     ProductTitle(title: 'Price:', smallSize: true,),
                  Row(
                    children: [
                      Text('\$25',
                      style: Theme.of(context).textTheme.titleSmall!.apply(decoration:TextDecoration.lineThrough ),

                      ),
                const      SizedBox(width: TSizes.spaceBtwItems,),
                const      TProductPriceText(price: '20')
                    ],
                  )
                ],
              ),
              Row(
                children: [
                const  ProductTitle(title: 'Stock', smallSize: true,),
                  Text('In Stock', style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            const  ProductTitle(title: 'THis is the description of the product and it can go up to maximum 4 lines',
              smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
     const   SizedBox(height: TSizes.spaceBtwItems,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const TSectionHeading(text: 'Colors'),
             const SizedBox(height: TSizes.spaceBtwItems/2, ),
           Wrap(
             spacing: 8,
             children: [
               TChoiceChip(text: 'Green', selected: true, onSelected: (value){},),
               TChoiceChip(text: 'Blue', selected: false,onSelected: (value){}),
               TChoiceChip(text: 'Yellow', selected: true,onSelected: (value){}),
             ],
           )

         ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const  TSectionHeading(text: 'Size'),
        const    SizedBox(height: TSizes.spaceBtwItems/2,),
            Wrap(

              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true,onSelected: (value){}),
                TChoiceChip(text: 'EU 36', selected: true,onSelected: (value){}),
                TChoiceChip(text: 'EU 38', selected: false,onSelected: (value){}),
              ],
            )

          ],
        )
      ],

    );
  }
}


