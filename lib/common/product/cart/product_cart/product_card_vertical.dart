import 'package:e_commerce/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/images/round_image.dart';
import 'package:e_commerce/common/widgets/texts/product_price.dart';
import 'package:e_commerce/common/widgets/texts/product_title_texts.dart';
import 'package:e_commerce/features/shop/screens/prduct_details/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../icons/t_circular_icon.dart';
import '../../../styles/shadows.dart';
import '../../../widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:get/get.dart';
class TProductCartVertical extends StatelessWidget {
  const TProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: darkMode? TColors.darkGrey : TColors.white,
          boxShadow: [TShadowStyles.verticalProductShadow]
        ),
        child: Column(
          children: [
            TCircularContainer(
              height: 180,
              backGroundColor: darkMode? TColors.dark : TColors.light,
              padding: const EdgeInsets.all(TSizes.sm),
              child:  Stack(
                children:  [
                  //Thumbnail
              const    TRoundedImage(
                    fit: BoxFit.fill,
                      imageUrl: TImages.productImage1,
                  applyRadius: true,),

                  //Sale tag
                  Positioned(
                    top: 12,
                    child: TCircularContainer(
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
                  ),
              const     Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,

                    ),
                  )

                ],
              ),
            ),
            //Details
            const Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       ProductTitle(
         title: "Green Nike Air Shoes", smallSize: true,),
         SizedBox(height: TSizes.spaceBtwItems/2,),
      BrandTitleWithVerifiedIcon(title: 'Nike',),


        ],
      )
             ),
          const      Spacer(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    const  TProductPriceText(price: '35.0'),
                     Container(
                       decoration: const BoxDecoration(
                         color: TColors.dark,
                         borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(TSizes.borderRadiusMd),
                             bottomRight: Radius.circular(TSizes.productItemWidth)
                         ),

                       ),
                       child: const SizedBox(
                           width: TSizes.iconLg*1.2,
                           height: TSizes.iconLg*1.2,
                           child: Center(
                               child: Icon(Iconsax.add, color: Colors.white,))),
                     )
                   ],
                 )


          ],
        ),
      ),
    );
  }
}




