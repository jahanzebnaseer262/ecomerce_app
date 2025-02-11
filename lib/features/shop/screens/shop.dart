
import 'package:e_commerce/preferred_size_widgets/tabbar.dart';
import 'package:flutter/material.dart';


import '../../../common/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/appbar.dart';
import '../../../common/widgets/brands/Brand_Cart.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../common/widgets/menu_icon/cart_menu_icon.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../widgets/categorytab.dart';
import 'brands/all_brands.dart';
import 'package:get/get.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: Colors.white,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {

            return [
              SliverAppBar(

                automaticallyImplyLeading: false,
                pinned: false,
                floating: true,
                backgroundColor: darkMode ? Colors.black : Colors.white,
                expandedHeight: TDeviceUtils.getScreenHeight(context),
                flexibleSpace: FlexibleSpaceBar(

                  background: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        TSectionHeading(
                          text: "Featured Brands",
                          onPressed: ()=>Get.to(()=>const AllBrands()),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        Expanded(
                          child: TGridView(
                          mainAxisExtent: 50,
                            itemCount: 4,
                            itemBuilder: (context , index ) {
                              return const ProductDetailsContainer();
                            },

                          ),
                        )

                      ],
                    ),
                  ),
                ),

                bottom: const TTabBar(
                    tabs: [
                      Text('Sports'),
                      Text('Furniture'),
                      Text('Electronics'),
                      Text('Clothes'),
                      Text('Cosmetics')
                    ])
              ),
            ];
          },
          body:  const TabBarView(
              children: [
                TCategoryTab()

              ])
        ),
      ),
    );
  }
}






