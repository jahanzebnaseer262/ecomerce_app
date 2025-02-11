import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/prduct_details/widgets/product_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/prduct_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/prduct_details/widgets/product_image_slider.dart';
import 'package:e_commerce/features/shop/screens/prduct_details/widgets/product_reviews.dart';
import 'package:e_commerce/features/shop/screens/prduct_details/widgets/rattingshare.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/size.dart';
class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         // mainAxisSize: MainAxisSize.min,
          children: [
            //Product slider
            const TProductImageSlider(),
            // Product Details
            Padding(
                padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                  left: TSizes.defaultSpace
                ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
              //Rating and share
                 const TRattingShare(),
                  //Price, title, stock and brand
                 const TRattingShare(),

                  //Attributes
                  const TProductAttributes(),
               const   SizedBox(height: TSizes.spaceBtwSections,),

                  //Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('CheckOut')),
                  ),
                  const   SizedBox(height: TSizes.spaceBtwSections,),
                  //Description
               const   TSectionHeading(text: 'Description', showActionButton: false,),
                  const   SizedBox(height: TSizes.spaceBtwItems,),
          const        ReadMoreText(
                    'This  is a description for Black channel purse, it come with a lon strip, paper bag This  is a description for Black channel purse, it come with a lon strip, paper bag and dust bagThis  is a description for Black channel purse, it come with a lon strip, paper bag and dust bagThis  is a description for Black channel purse, it come with a lon strip, paper bag and dust bag',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'showMore',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),

          ),
                const  Divider(),
               const   SizedBox(height: TSizes.spaceBtwItems,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  const  TSectionHeading(text: 'Review(199)', showActionButton: false,),
    IconButton(onPressed: ()=>Get.to(()=> const ProductReviews()), icon: const Icon(Iconsax.align_right3, size: 18,color: Colors.red,))
  ],
),

               
               const   SizedBox(height: TSizes.spaceBtwSections,),
                  const TBottomAddToCart()

                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}




