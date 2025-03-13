
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/authentication/screens/home/promo_slider.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:flutter/material.dart';
import '../../../../common/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/custom_shapes/containers/search_container.dart';
import '../../../../common/product/cart/product_cart/product_card_vertical.dart';
import '../../../../common/widgets/image_texts/vertical_image_texts.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/menu_icon/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../shop/screens/all_product/all_products.dart';
import '../../../shop/screens/cart/cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    showBackArrow: true,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.homeAppbarTitle,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: TColors.grey),
                        ),
                        Obx(
                              ()  =>  Text(
                           controller.user.value.fullName ,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(color: TColors.textWhite),
                          ),
                        )
                      ],
                    ),
                    actions: [
                      TCartCounterIcon(
                        onPressed:()=> Get.to(()=> const CartScreen()),
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(
                    text: "Search in Store",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const TSectionHeading(
                          text: "Popular Categories",
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return TVerticalPaddingWidget(
                                  image: TImages.google,
                                  title: 'Shoe Category',
                                  onTap: ()=> Get.to(()=> const SubCategoriesScreen()),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                const  SizedBox(height: TSizes.spaceBtwSections,)
                ],
              ),
            ),
            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
            const  TPromoSlider(),

           const   SizedBox(height: TSizes.spaceBtwSections),

              //heading
              TSectionHeading(text: 'Popular Products', onPressed: ()=>Get.to(()=>const AllProducts())),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Popular products
              TGridView(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return const TProductCartVertical(

                  );
                }
              ),

            ],
          ),

          )
          ],
        ),
      ),
    );
  }
}




