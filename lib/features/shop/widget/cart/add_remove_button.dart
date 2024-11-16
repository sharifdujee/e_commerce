import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/icon/t_cicular_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TProductQuantityWithAddAndRemoveIcon extends StatelessWidget {
  const TProductQuantityWithAddAndRemoveIcon({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });
  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        /// add and remove button
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TCircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: dark ? TColors.white : TColors.black,
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              onPressed: remove,
            ),
          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItem,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItem,
        ),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: Colors.white,
          backgroundColor: TColors.primaryColor,
          onPressed: add,
        ),
      ],
    );
  }
}
