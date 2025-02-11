import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../custom_shapes/containers/circular_container.dart';
class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return TCircularContainer(
      showBorder: true,
      backGroundColor: darkMode ? TColors.dark : TColors.white,
      padding: const  EdgeInsets.only(
          top: TSizes.sm,
          left: TSizes.sm,
          right: TSizes.sm,
          bottom: TSizes.sm),
      child: Row(
        children: [
          //TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  border: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),
          //Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: darkMode
                          ? TColors.white.withOpacity(0.5)
                          : TColors.black.withOpacity(0.5),
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      side: BorderSide(color: Colors.grey.withOpacity(0.1))
                  ),
                  child: const Text('Apply')))
        ],
      ),
    );
  }
}
