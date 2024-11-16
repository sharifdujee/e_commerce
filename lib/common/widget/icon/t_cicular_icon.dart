import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key, this.height, this.width, this.size= TSizes.lg, this.icon, this.color, this.backgroundColor, this.onPressed,
  });

  final double? height, width, size;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor!=null? backgroundColor!
              : dark? TColors.black.withOpacity(0.9)
              : TColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(onPressed:onPressed, icon:  Icon(icon, color: color,size: size,)),
    );
  }
}
