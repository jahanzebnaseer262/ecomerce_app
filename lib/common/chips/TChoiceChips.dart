import 'package:e_commerce/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;


  @override
  Widget build(BuildContext context) {
    final  isColor= THelperFunctions.getColor(text)!=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle:  TextStyle(color: selected ? TColors.white: null),
      //check error using const
      avatar: isColor ?  TCircularContainer(height: 50, width: 50, backGroundColor: THelperFunctions.getColor(text)!,) : null,

        shape: isColor? const CircleBorder() : null,
        backgroundColor: isColor? THelperFunctions.getColor(text)! : null,
        labelPadding: isColor? const EdgeInsets.all(0) : null,
        padding: const EdgeInsets.all(0),
        selectedColor: Colors.green,
      ),
    );
  }
}