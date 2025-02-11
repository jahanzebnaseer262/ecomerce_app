import 'package:e_commerce/common/product/cart/product_cart/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/brands/BrandShowCase.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/size.dart';
class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //Brands
          const  TBrandShowCase(
              imagesUrl: [
                TImages.productImage3,
                TImages.productImage3,
                TImages.productImage3
              ],
            ),
            const   SizedBox(height: TSizes.spaceBtwItems,),
            //Product
            TSectionHeading(text: 'You might Like',
      
              onPressed: (){},
            ),
         const   SizedBox(height: TSizes.spaceBtwItems,),
            TGridView(itemCount: 10, itemBuilder: (_,index){
              return const TProductCartVertical();
            }),
            const   SizedBox(height: TSizes.spaceBtwSections,),
      
          ],
        ),
      
      
      ),
    ]
    );
  }
}
