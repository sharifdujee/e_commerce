import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/simmer_effect.dart';

import 'package:flutter/material.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key, this.itemCount=4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,

          itemBuilder: (_, __)=>const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TShimmerEffect(width: 120, height: 120),
              SizedBox(
                width: TSizes.spaceBtwItem,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: TSizes.spaceBtwItem/2,
                  ),

                ],
              )
             ],

          ),
          separatorBuilder: (context, index)=>const SizedBox(height: TSizes.spaceBtwItem,),
          itemCount: itemCount),
    );
  }
}
