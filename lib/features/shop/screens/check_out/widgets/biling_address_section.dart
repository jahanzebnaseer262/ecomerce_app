import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/size.dart';
class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          text: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: (){},
        ),
        Text('Jahanzeb Naseer', style: Theme.of(context).textTheme.bodyLarge,),
        const  SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
          const  Icon(Icons.phone, color: Colors.grey, size: 16,),
         const   SizedBox(width: TSizes.spaceBtwItems,),
            Text('03469_.......',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      const  SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const  Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const   SizedBox(width: TSizes.spaceBtwItems,),
            Text('Pakistan',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const  SizedBox(height: TSizes.spaceBtwItems/2,),
      ],
    );
  }
}
