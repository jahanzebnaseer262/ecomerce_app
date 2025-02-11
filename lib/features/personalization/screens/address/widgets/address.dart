
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/personalization/screens/address/widgets/single_adress.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/size.dart';
import 'add_new_address.dart';
class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
          onPressed: ()=>Get.to(()=> const AddNewAddress()),
      child: const Icon(Iconsax.add, color: TColors.white,),

      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Address', style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
             TSingleAddress(selectedAddress: true),
              TSingleAddress(selectedAddress: false)
            ],
          ),
        ),
      ),
    );
  }
}
