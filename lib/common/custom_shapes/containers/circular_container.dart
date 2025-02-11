import 'package:flutter/material.dart';
class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.height,
    this.width ,
    this.radius = 400,
    this.padding ,
    this.child,
    this.backGroundColor = Colors.white,
    this.margin,
    this.showBorder=false
  });

  final double? height;
  final double? width;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backGroundColor;
  final bool? showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backGroundColor,
        border: showBorder! ? Border.all(color: Colors.black12) : null
      ),
      child: child,
    );
  }
}