
import 'package:e_commerce_admin_panel/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants/colors.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({super.key, required this.width, required this.height,  this.radius =15, this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color??(dark?TColors.darkerGrey:TColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      baseColor: dark?Colors.grey[850]!:Colors.grey[300]!,
      highlightColor:dark?Colors.grey[700]!:Colors.grey[100]!,
    );
  }
}