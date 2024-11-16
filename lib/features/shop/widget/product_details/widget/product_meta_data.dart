import 'package:e_commerce_app/common/widget/custom_shape/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widget/images/tcircular_images.dart';
import 'package:e_commerce_app/common/widget/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widget/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widget/texts/t-brand_title_with_icon.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/features/shop/controller/product_controller.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// price  and sale tag
        Row(
          children: [
            ///sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$salePercentage',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.primaryColor),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItem,
            ),

            /// price
            if(product.productType == ProductType.single.name&& product.salePrice>0)
            Text(
              '\$${product.price}', // This will display the original price
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough), // Strikethrough for original price
            ),
            const SizedBox(
              width: TSizes.spaceBtwItem,
            ),

            TProductPriceText(
              price: (product.salePrice != 0.0 ? product.salePrice : controller.getProductPrice(product)).toString(),
              isLarge: true, // Ensure this is the sale price or the regular price, depending on your needs
            )

          ],
        ),

        ///title
        const SizedBox(
          height: TSizes.defaultSpace / 1.5,
        ),

        /// title
         TProductTitleText(title: product.title),
        const SizedBox(
          height: TSizes.defaultSpace / 1.5,
        ),

        /// stock status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtwItem,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          height: TSizes.defaultSpace / 1.5,
        ),

        /// brand
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : TImages.productImage5,
              height: 32,
              width: 32,
              isNetworkImage: true,
              //overlyColor: darkMode ? Colors.white : Colors.black,
              title: '',
              fit: BoxFit.cover, // Ensures the image fills the circle while maintaining its aspect ratio
              onTap: () {
                // Add onTap action if needed
              },
            ),


            const SizedBox(
              width: TSizes.spaceBtwItem /4,
            ),
             TBrandTitleWithVerifyIcon(
              title: product.brand!=null? product.brand!.name:'',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
