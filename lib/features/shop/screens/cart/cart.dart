import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/size.dart';
import '../check_out/widgets/check_outs.dart';
import 'cart_items.dart';
import 'package:get/get.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
        child: CartItems()

        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckOutScreen()), child: const Text('CheckOut \$250')),
      ),

    );
  }
}




