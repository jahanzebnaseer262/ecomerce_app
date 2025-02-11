import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,

   this.width,
   this.height,
     this.size= TSizes.lg,
    required this.icon,
    this.color,
    this.backGroundColor,
     this.onPressed,
  });


  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backGroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backGroundColor!=null ? backGroundColor!:  darkMode ? TColors.black : TColors.white,
      ),
      child: IconButton(onPressed: (){},
        icon: Icon(icon,
        color: color,
          size: size,
        ),
      ),
    );
  }
}