import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
import 'order_list.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const  Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
        child:  TOrderList(),

      ),
    );
  }
}
