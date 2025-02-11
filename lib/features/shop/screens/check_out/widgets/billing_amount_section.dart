import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        //Shipping tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        //Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge,)
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/2,),
        //Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0', style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),


      ],
    );
  }
}
