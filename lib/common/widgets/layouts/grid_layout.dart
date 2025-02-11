import 'package:flutter/material.dart';

import '../../../utils/constants/size.dart';
class TGridView extends StatelessWidget {
  const TGridView({
    super.key, required this.itemCount,
    this.mainAxisExtent=288,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: TSizes.gridviewSpacing, //horizontal
          mainAxisSpacing: TSizes.gridviewSpacing, //vertical
          mainAxisExtent: 288
      ),
      itemBuilder: itemBuilder,



    );
  }
}