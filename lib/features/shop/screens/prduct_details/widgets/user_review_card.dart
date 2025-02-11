import 'package:e_commerce/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/features/shop/screens/prduct_details/products/product_indicator.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/size.dart';
class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(

            children: [
              const  CircleAvatar(
                backgroundImage: AssetImage(TImages.google),
              ),
              const   SizedBox(width: TSizes.spaceBtwItems,),
              Text('John Doe', style: Theme.of(context).textTheme.titleLarge,)
            ],
          ),

        IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
    ]
    ),
        const   SizedBox(width: TSizes.spaceBtwItems,),
        Row(
          children: [
           const TRatingBarIndicator(rating: 4),
          const  SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
      const  SizedBox(height: TSizes.spaceBtwItems,),
    const  ReadMoreText(
          'The user interface of the app is beautiful and user friendly',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show mow',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
     const   SizedBox(height: TSizes.spaceBtwItems,),
        TCircularContainer(
          backGroundColor: darkMode? TColors.darkerGrey : TColors.grey ,
          child: Padding(
              padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's store", style: Theme.of(context).textTheme.bodyLarge, ),
                    Text('02 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,)
                  ],
                ),
                const  SizedBox(height: TSizes.spaceBtwItems,),
                const  ReadMoreText(
                  'The user interface of the app is beautiful and user friendly',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show mow',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),

          ),
        )

      ],
    );
  }
}
