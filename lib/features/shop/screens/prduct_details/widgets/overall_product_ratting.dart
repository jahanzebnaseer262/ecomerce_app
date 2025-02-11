import 'package:e_commerce/features/shop/screens/prduct_details/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
class OverAllProductRating extends StatelessWidget {
  const OverAllProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text('4.8',
                style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          child: Column(
            children: [
              TRattingProgressIndicator(text: '5', value: 1.0,),
              TRattingProgressIndicator(text: '4', value: 0.8,),
              TRattingProgressIndicator(text: '3', value: 0.6,),
              TRattingProgressIndicator(text: '2', value: 0.4,),
              TRattingProgressIndicator(text: '1', value: 0.2,),
            ],
          ),
        )
      ],
    );
  }
}