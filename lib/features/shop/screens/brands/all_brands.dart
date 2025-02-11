import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/Brand_Cart.dart';

import '../../../../utils/constants/size.dart';
import 'package:get/get.dart';

import 'brand_product.dart';
class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding:const  EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              const     TSectionHeading(
                text: 'Brands',
                showActionButton: false,),
            const   SizedBox(height: TSizes.spaceBtwItems,),
              //Brands
              TGridView(
                mainAxisExtent: 80,
                  itemCount: 8,
                  itemBuilder: (context,index){
                    return ProductDetailsContainer(
onTap: ()=>Get.to(()=>const BrandProduct()),
                    );
                  })

            ],
          ),

        ),
      ),
    );
  }
}
