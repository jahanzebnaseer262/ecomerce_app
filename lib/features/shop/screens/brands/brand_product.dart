import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/brands/Brand_Cart.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/sort/sort.dart';
import '../../../../utils/constants/size.dart';
class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  TAppBar(title: Text('Data'),),
      body: SingleChildScrollView(
        child: Padding(
            padding:  EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //Brand Cart
             ProductDetailsContainer(),
             SizedBox(height: TSizes.spaceBtwSections,),
            TSortableProducts()
          ],
        ),
        ),
      ),
    );
  }
}
