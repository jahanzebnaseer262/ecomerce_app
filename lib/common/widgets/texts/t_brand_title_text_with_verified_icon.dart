import 'package:e_commerce/common/widgets/texts/t_brand_title.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines=1,
    this.textColor,
    this.iconColor=TColors.primary,
    this.textAlign= TextAlign.center,
     this.brandTextSize= TextSizes.small,
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: BrandTitleText(
                title: title,
            textAlign: textAlign,
              maxLines: maxLines,
              color: textColor,
              brandTextSizes: brandTextSize,

            )),
        const SizedBox(width: TSizes.xs,),
       Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconXs,)
      ],
    );
  }
}