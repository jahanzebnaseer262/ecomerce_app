import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/circular_container.dart';
import 'Brand_Cart.dart';
class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.imagesUrl,
  });

  final List<String> imagesUrl;
  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      showBorder: true,
      radius: 20,
      backGroundColor: Colors.transparent,
      margin:  const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const  EdgeInsets.only(bottom: TSizes.md),
      child: Column(
        children: [
          const ProductDetailsContainer(
           ),

          //Brand top 3 product images
          Row(
              children: imagesUrl.map((images)=> brandTopProductImageWidget(images, context)).toList()
          )


        ],
      ),

    );
  }
}
Widget brandTopProductImageWidget(String image, context){
  return Expanded(
      child: TCircularContainer(
        height: 100,
        backGroundColor: THelperFunctions.isDarkMode(context) ?TColors.darkGrey :TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child:  Image(
          image: AssetImage(image),
          fit: BoxFit.contain,),
      ));
}