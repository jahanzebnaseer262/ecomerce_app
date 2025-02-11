import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/size.dart';
import '../../custom_shapes/containers/circular_container.dart';
import '../../images/circular_image.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';
class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({
    super.key,
    this.onTap,
  });


  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TCircularContainer(
        //height: 100,
        // width: 100,
        padding: const EdgeInsets.all(TSizes.sm),

        showBorder: true,
        radius: 20,

        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TCircularImage(
                imageUrl: TImages.clothIcon,
                backgroundColor: Colors.transparent,
                overLayColor: darkMode
                    ? TColors.white
                    : TColors.black,
              ),
              const SizedBox(
                  width: TSizes.spaceBtwItems / 2),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   const  BrandTitleWithVerifiedIcon(
                      title: 'Nike',
                      brandTextSize: TextSizes.large,
                    ),
                    Text(
                      '256 Products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    ),
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}