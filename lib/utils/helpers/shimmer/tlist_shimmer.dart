
import 'package:e_commerce_app/utils/helpers/shimmer/simmer_effect.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';



class TListShimmerEffect extends StatelessWidget {
  const TListShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 50, radius: 50,),
            SizedBox(width: TSizes.spaceBtwItem,),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItem/2,),
                TShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
