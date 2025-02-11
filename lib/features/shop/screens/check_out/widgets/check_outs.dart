import 'package:e_commerce/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/widgets_login_signup/Success/success_screen.dart';
import 'package:e_commerce/features/authentication/screens/bottom_navigation.dart';
import 'package:e_commerce/features/shop/screens/cart/cart_items.dart';
import 'package:e_commerce/features/shop/screens/check_out/widgets/biling_address_section.dart';
import 'package:e_commerce/features/shop/screens/check_out/widgets/billing_payment_section.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/product/cart/product_cart/coupon_widget.dart';
import '../../../../../common/widgets/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/size.dart';
import 'billing_amount_section.dart';
import 'package:get/get.dart';
class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
             const  CartItems(
                addShowRemoveButton: false,
              ),
          const     SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Coupon TextFiled
       const       TCouponCode(),
     const          SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Billing section
              TCircularContainer(
                radius: 30,
                showBorder: true,
                backGroundColor: darkMode? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    ///Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    ///Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    ///Payment method
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TBillingPaymentSection(),
                    ///Address
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=> SuccessScreen(
            title: 'payment succesfull',
            image: TImages.successfulPaymentIcon,
            subTitle: 'Your item will be shipped soon',
            onPressed: ()=>Get.offAll(()=> const  NavigationMenu()))),
            child: const Text('CheckOut \$250')),
      ),
    );
  }
}


