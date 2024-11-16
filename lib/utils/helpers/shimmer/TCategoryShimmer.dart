
import 'package:e_commerce_app/utils/helpers/shimmer/simmer_effect.dart';
import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount=6});
  final int itemCount;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __)=>const SizedBox(width: TSizes.spaceBtwItem,),
        itemBuilder: (_, __){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Image
              TShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(
                height: TSizes.spaceBtwItem/2,
              ),
              ///Text
              TShimmerEffect(width: 55, height: 8)

            ],
          );
        },
          ),
    );
  }
}
