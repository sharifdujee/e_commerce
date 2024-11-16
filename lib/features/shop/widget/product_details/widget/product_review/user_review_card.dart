import 'package:e_commerce_app/common/widget/custom_shape/containers/rounded_container.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_review/rating_bar_indicator.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userImage3),
                ),
                 const SizedBox(
                  width: TSizes.spaceBtwItem,
                ),

                Text('Amit Hasan',style: Theme.of(context).textTheme.bodyMedium,),
              ],
            ),
            IconButton(onPressed: (){}, icon:  const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItem,
        ),
        /// Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4.5),
            const SizedBox(
              width: TSizes.spaceBtwItem,
            ),
            Text('01 NOV 2024', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItem,
        ),
        const ReadMoreText('The user interface of the app is quite intuitive, I was able to navigate and make purchase seamlessly, Great Job',
        trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show Less',
          trimCollapsedText: 'Show More',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
        ),
        const SizedBox(
          width: TSizes.spaceBtwSections,
        ),
        ///Company Review

        TRoundedContainer(
          backgroundColor: dark? TColors.darkerGrey: TColors.grey,
          child: Padding(padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Md Robayet Bin Rahat', style: Theme.of(context).textTheme.titleMedium,),
                  Text('01 Nov 2024', style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItem,
              ),
              const ReadMoreText('The user interface of the app is quite intuitive, I was able to navigate and make purchase seamlessly, Great Job',
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimExpandedText: 'Show Less',
                trimCollapsedText: 'Show More',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
              ),
            ],
          ),),

        ),
        const SizedBox(
          height: TSizes.spaceBtwSections ,
        ),


      ],
    );
  }
}
