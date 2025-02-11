import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/images/round_image.dart';
import '../../../../../common/widgets/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/size.dart';
class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
        child: Container(
          color: darkMode? TColors.darkGrey : TColors.white,
          child: ProductMetaData(darkMode: darkMode),
        )
    );
  }
}

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      const  SizedBox(
            height: 400,
            child: Padding(
              padding:  EdgeInsets.all(TSizes.productImageRadius*2),
              child:  Center(child: Image(image: AssetImage(TImages.productImage1))),
            )),
        Positioned(
          right: 0,
          bottom: 30,
          child: SizedBox(
            height: 80,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (_,index){
                  return  TRoundedImage(
                      width: 80,
                      backgroundColor: darkMode? TColors.dark : TColors.white,
                      border: Border.all(color: TColors.primary),
                      padding: const EdgeInsets.all(TSizes.sm),
                      imageUrl: TImages.productImage3);
                },
                separatorBuilder: (_,__){
                  return const SizedBox(width: TSizes.spaceBtwItems,);
                },
                itemCount: 20),
          ),
        ),
        TAppBar(
          showBackArrow: true,
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(Iconsax.heart,color: Colors.red,))
          ],
        )


      ],
    );
  }
}