import 'package:e_commerce_app/common/layout/grid_layout.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/simmer_effect.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class TVerticalCardShimmer extends StatelessWidget {
  const TVerticalCardShimmer({super.key,  this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return  TGridLayout(itemCount: itemCount,
        itemBuilder: (_, __)=>const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 180, height: 180),
              SizedBox(height: TSizes.spaceBtwItem,),
              ///Text
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBtwItem,),
              TShimmerEffect(width: 110, height: 15),

            ],
          ),
        ));
  }
}
