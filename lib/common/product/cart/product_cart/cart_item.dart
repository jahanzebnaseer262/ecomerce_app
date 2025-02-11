import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../images/round_image.dart';
import '../../../widgets/texts/t_brand_title_text_with_verified_icon.dart';


class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Flexible(
          child: TRoundedImage(
            imageUrl: TImages.productImage1,
            height: 60,
            width: 60,
            padding: const  EdgeInsets.all(TSizes.sm),
            backgroundColor: darkMode? TColors.darkerGrey :TColors.white,

          ),
        ),
        const    SizedBox(width: TSizes.spaceBtwItems,),
        //Title, price and Size
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const BrandTitleWithVerifiedIcon(title: 'Nike'),
              Text(' Black Sports Shoes',
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 1,
              ),
              //Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UK 08', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )

      ],
    );
  }
}