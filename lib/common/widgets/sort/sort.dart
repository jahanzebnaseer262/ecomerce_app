import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/size.dart';
import '../../product/cart/product_cart/product_card_vertical.dart';
import '../layouts/grid_layout.dart';
class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              'Name',
              'Higher Prices',
              'Lower Prices',
              'Sale',
              'Newest',
              'popularity'
            ]
                .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option)))
                .toList(),
            onChanged: (value) {}),
      const  SizedBox(height: TSizes.spaceBtwSections,),
        TGridView(
            itemCount: 20,
            itemBuilder: (context,index){
              return const TProductCartVertical();
            })
      ],
    );
  }
}