import 'package:e_commerce_app/common/widget/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widget/texts/tbrand_title_text.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TBrandTitleWithVerifyIcon extends StatelessWidget {
  const TBrandTitleWithVerifyIcon({
    super.key,
    required this.title,
     this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primaryColor,
    this.textAlign = TextAlign.center,
     this.brandTextSizes = TextSizes.small
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: TBrandTitleText(
            title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize : brandTextSizes


        )),
        const SizedBox(
          width: TSizes.xs,
        ),
        Icon(Iconsax.verify, color: iconColor, size: TSizes.iconXs,)
      ],
    );
  }
}
