import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.height,
    this.width ,
    required this.imageUrl,
    this.applyRadius = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit= BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  final double? height, width;
  final String imageUrl;
  final bool applyRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applyRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl),
            )),
      ),
    );
  }
}