import 'package:e_commerce/common/product/cart/product_cart/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/features/authentication/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/size.dart';
class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WishList',style: Theme.of(context).textTheme.headlineMedium,),
      actions: [
        IconButton(onPressed: ()=> Get.to( const HomeScreen()), icon: const Icon(Iconsax.add))
      ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TGridView(itemCount: 4, itemBuilder: (_, index){
              return const TProductCartVertical();
            })
          ],
        ),

        ),
      ),
    );
  }
}
