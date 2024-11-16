import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_review/product_overall_rating.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_review/rating_bar_indicator.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_review/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        title: Text('Ratings & Reviews' ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child:  Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ratings and reviews are verified and are from people who use the same type of device that you use'),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            /// Overall products ratings

            const OverAllProductRating(),
            const TRatingBarIndicator(rating: 3.5,),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// user Review List
            const UserReviewCard(),
            const UserReviewCard(),

          ],
        ),),

      ),
    );
  }
}






