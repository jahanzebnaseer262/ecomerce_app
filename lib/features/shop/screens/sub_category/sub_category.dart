import 'package:e_commerce/common/images/round_image.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../common/product/cart/product_cart/product_card_horizontal.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/size.dart';
class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  const TAppBar(title: Text('Sports Shirts'),
      showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //Banner
            const TRoundedImage(
                width:double.infinity,
                imageUrl: TImages.banner2,
            applyRadius: true,
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            //SubCategories
            Column(
              children: [
                TSectionHeading(text: 'Sports Shirt', onPressed: (){},),
             const   SizedBox(height: TSizes.spaceBtwSections/2,),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index)=> const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index)=> const ProductCardHorizontal()),
                )
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
