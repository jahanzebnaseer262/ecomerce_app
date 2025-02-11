import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../../utils/helpers/helper_functions.dart';
class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,

    this.height= 56,
    this.width= 56,
    required this.imageUrl,
    required this.backgroundColor,
    this.fit= BoxFit.cover,
    this.padding= TSizes.sm,
    this.isNetworkImage = false,
    this.onPressed,
    this.overLayColor,

  });


  final double? height, width;
  final String imageUrl;

  final Color? backgroundColor;
  final Color? overLayColor;
  final BoxFit? fit;
  final double padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding:  EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: backgroundColor?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
            borderRadius: BorderRadius.circular(100),


        ),
        child: Image(
          fit: fit,
          image: isNetworkImage? NetworkImage(imageUrl) :AssetImage(imageUrl),
          color: overLayColor,

        )
    );
  }
}