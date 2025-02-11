import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/size.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/custom_shapes/containers/circular_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TCircularContainer(
        width: double.infinity,
        showBorder: true,
        backGroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
        // borderColor: selectedAddress
        //     ? Colors.transparent
        //     : dark
        //     ? TColors.darkerGrey
        //     : TColors.grey,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                right: 20,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                      ? TColors.light
                      : TColors.dark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jahanzeb Naseer',
                  maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
               const   SizedBox(height: TSizes.sm/2,),
               const   Text('+9234345665', maxLines: 1, overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: TSizes.sm/2,),
             const  Text('City Rawalakot, District Poonch, Tehseel Rawalakot',softWrap: true,),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
