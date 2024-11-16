import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_function.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key, required this.text, this.icon = Iconsax.search_normal ,  this.showBackground = true,  this.showBorder = true, this.onTap, this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground;
  final bool showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: showBackground? darkMode? TColors.dark: TColors.white: Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border:showBorder? Border.all(color: TColors.grey) : null,

          ),
          child: Row(
            children: [
              Icon(icon, color: TColors.darkGrey,),
              const SizedBox(
                width: TSizes.spaceBtwItem,
              ),
              Text(text, style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: darkMode? TColors.white: TColors.black
              ),)
            ],
          ),

        ),
      ),
    );
  }
}