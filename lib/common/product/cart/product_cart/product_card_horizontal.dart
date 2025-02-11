import 'package:e_commerce/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/images/round_image.dart';
import 'package:e_commerce/common/widgets/texts/product_price.dart';
import 'package:e_commerce/common/widgets/texts/product_title_texts.dart';
import 'package:e_commerce/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../icons/t_circular_icon.dart';
import '../../../styles/shadows.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: darkMode ? TColors.darkGrey : TColors.lightContainer,
          boxShadow: [TShadowStyles.verticalProductShadow]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
//ThumbNail
          Expanded(
            child: TCircularContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              child: Stack(
                children: [
                  //ThumbNail image
                  const SizedBox(
                      height: 120,
                      width: 120,
                      child: TRoundedImage(
                        imageUrl: TImages.productImage1,
                        applyRadius: true,
                      )),
                  Positioned(
                    top: 10,
                    child: TCircularContainer(
                        height: 30,
                        width: 50,
                        radius: TSizes.sm,
                        backGroundColor: TColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          "25%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        )),
                  ),
                  const Positioned(
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    children: [
                      ProductTitle(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      BrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: TProductPriceText(price: '256.0')),

                      ///Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.borderRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.productItemWidth)),
                        ),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(
                                child: Icon(
                              Iconsax.add,
                              color: Colors.white,
                            ))),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
