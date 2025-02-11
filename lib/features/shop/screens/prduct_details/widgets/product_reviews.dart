import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/shop/screens/prduct_details/widgets/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
import '../products/product_indicator.dart';
import 'overall_product_ratting.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews and Ratings'),
        showBackArrow: true,
      ),
      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //overall product ratings
              const OverAllProductRating(),
          const    TRatingBarIndicator(
                rating: 4.5,
              ),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
            const  SizedBox(height: TSizes.spaceBtwSections,),
              //UserReview List
              const UserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}






