import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
class TRattingProgressIndicator extends StatelessWidget {
  const TRattingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(

        child: Text(text,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      Expanded(
        child: SizedBox(
          width: TDeviceUtils.getScreenWidth(context) * 0.5,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 11,
            backgroundColor: TColors.grey,
            borderRadius: BorderRadius.circular(7),
            valueColor:
            const AlwaysStoppedAnimation(TColors.primary),
          ),
        ),
      )
    ]);
  }
}
