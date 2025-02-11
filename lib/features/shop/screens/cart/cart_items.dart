import 'package:flutter/material.dart';

import '../../../../common/product/cart/add_remove_button.dart';
import '../../../../common/product/cart/product_cart/cart_item.dart';
import '../../../../common/widgets/texts/product_price.dart';
import '../../../../utils/constants/size.dart';
class CartItems extends StatelessWidget {
  const CartItems({super.key,
    this.addShowRemoveButton=true
  });
  final bool addShowRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_,index){
          return Column(
            children: [
               const TCartItem(),
         if(addShowRemoveButton)     const SizedBox(height: TSizes.spaceBtwItems,),
               if(addShowRemoveButton)
               const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70,),
                      TProductAddRemoveButton(),
                      TProductPriceText(price: '250')
                    ],
                  ),
                  //Add Remove Button


                ],
              )
            ],
          );
        },
        separatorBuilder: (_,__){
          return  const SizedBox(height: TSizes.spaceBtwSections,);
        },
        itemCount: 4);
  }
}
