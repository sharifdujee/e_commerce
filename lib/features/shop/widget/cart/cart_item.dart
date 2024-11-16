import 'package:e_commerce_app/common/widget/images/t_rounded_image.dart';
import 'package:e_commerce_app/features/personalization/model/cart_model/cart_item_model.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/texts/product_price_text.dart';
import '../../../../common/widget/texts/product_title_text.dart';
import '../../../../common/widget/texts/t-brand_title_with_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem

  });
  final CartItemModel cartItem;




  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        /// display product image
        TRoundedImage(
          imageUrl: cartItem.image??'',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark? TColors.darkerGrey:TColors.grey ,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItem,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TBrandTitleWithVerifyIcon(title: cartItem.brandName??''),
               Flexible(child: TProductTitleText(title:cartItem.title??'', maxLines: 1,)),

              /// attributes
              Text.rich(TextSpan(
                  children:(cartItem.selectedVariation??{}).entries.map((e)=>TextSpan(children:[
                    TextSpan(text: '${e.key}', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '${e.value}', style: Theme.of(context).textTheme.bodyLarge),
                  ])).toList()
              )),

            ],
          ),
        )

      ],

    );
  }
}