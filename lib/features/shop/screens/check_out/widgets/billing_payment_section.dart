import 'package:e_commerce/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/size.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          text: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: (){},
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            TCircularContainer(
              width: 60,
              height: 35,
              backGroundColor: darkMode? TColors.light: TColors.dark,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const  Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Text('PayPal', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
