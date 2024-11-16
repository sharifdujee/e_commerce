import 'package:e_commerce_app/common/widget/custom_shape/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widget/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widget/product-cart/widget/favourite_icon.dart';
import 'package:e_commerce_app/common/widget/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widget/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widget/texts/t-brand_title_with_icon.dart';
import 'package:e_commerce_app/features/shop/controller/product_controller.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_details_screen.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/personalization/model/product/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
   /// print('Displaying product: ${product.title} with price: ${product.price}');
    final dark = THelperFunction.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.grey),
        child: Row(
          children: [
            /// Thumbnail
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(
                      isNetworkImage: true,
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                    ),
                  ),
                  /// Sale tag
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        ),
                      ),
                    ),
                  /// Favourite icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: FavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),

            /// Product Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title and subtitle
                        TProductTitleText(
                          title: product.title,
                          smallSizes: true,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItem / 2,
                        ),
                        TBrandTitleWithVerifyIcon(title: product.brand!.name),
                      ],
                    ),
                    const Spacer(),
                    SubCategory(product: product, controller: controller)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubCategory extends StatelessWidget {
  const SubCategory({
    super.key,
    required this.product,
    required this.controller,
  });

  final ProductModel product;
  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Price details
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.productType == ProductType.variable.name && product.salePrice > 0)
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Text(
                    product.price.toString(),
                    style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: TProductPriceText(price: controller.getProductPrice(product)),
              ),
            ],
          ),
        ),

        /// Add to cart button
        Container(
          decoration: const BoxDecoration(
              color: TColors.dark,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                  bottomRight: Radius.circular(TSizes.productImageRadius))),
          child: const SizedBox(
            width: TSizes.iconLg * 1.2,
            height: TSizes.iconLg * 1.2,
            child: Center(
              child: Icon(
                Iconsax.add,
                color: TColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
