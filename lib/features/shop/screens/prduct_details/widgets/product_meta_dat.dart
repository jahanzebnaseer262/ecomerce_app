import 'package:e_commerce/common/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/product_price.dart';
import 'package:e_commerce/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/size.dart';
class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      //Price and sale price
        Flexible(
          child: Row(
           children: [
             //Sale tag
             TCircularContainer(
                 height: 30,
                 width: 50,
                 radius: TSizes.sm,
                 backGroundColor: TColors.secondary.withOpacity(0.8),
                 padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                 child: Text(
                   "25%",
                   style:  Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black ),
                 )

             ),
                 const    SizedBox(width: TSizes.spaceBtwItems,),
             //Price
             Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(
               decoration: TextDecoration.lineThrough
             ),),
          const   SizedBox(width: TSizes.spaceBtwItems,),
           const  TProductPriceText(price: '175',isLarge: true,),

           ],
          ),
        ),
          const   SizedBox(height: TSizes.spaceBtwItems/2,),
          //Title
        const  TProductPriceText(price: 'Green Nike Sports shirt'),
          const   SizedBox(height: TSizes.spaceBtwItems/1.5,),

          Row(
            children: [
              const  TProductPriceText(price: 'Status'),
              const   SizedBox(width: TSizes.spaceBtwItems/1.5,),
              Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
            ],
          ),
          //Stock Status
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                TCircularImage(
                  imageUrl: TImages.cosmeticsIcon,
                  height: 32,
                  width: 32,
                  backgroundColor: darkMode ? TColors.white : TColors.black,
                ),
                const SizedBox(width: TSizes.spaceBtwItems / 1.5),
         const   Flexible(
              child:  BrandTitleWithVerifiedIcon(
                        title: 'Nike',
                        brandTextSize: TextSizes.medium,
                      ),
            ),
              ],
            ),
          )


          // const   SizedBox(height: TSizes.spaceBtwItems/1.5,),
          // Flexible(
          //   child: Row(
          //     // Removed mainAxisSize to let the Row expand
          //     children: [
          //       TCircularImage(
          //         imageUrl: TImages.cosmeticsIcon,
          //         height: 32,
          //         width: 32,
          //         backgroundColor: darkMode ? TColors.white : TColors.black,
          //       ),
          //       const SizedBox(width: TSizes.spaceBtwItems / 1.5),
          //       const BrandTitleWithVerifiedIcon(
          //         title: 'Nike',
          //         brandTextSize: TextSizes.medium,
          //       ),
          //       // Add a Spacer if needed to push items to the edges
          //     const  Spacer(),
          //     ],
          //   ),
          // ),



        ],
      ),
    );
  }
}
