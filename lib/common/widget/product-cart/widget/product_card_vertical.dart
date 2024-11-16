import 'package:e_commerce_app/common/widget/custom_shape/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widget/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widget/product-cart/widget/add_cart_button.dart';
import 'package:e_commerce_app/common/widget/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widget/texts/product_title_text.dart';
import 'package:e_commerce_app/features/personalization/controller/cart_controller/cart_controller.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_details_screen.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:e_commerce_app/common/style/TShadowStyle.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../features/shop/controller/product_controller.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icon/t_cicular_icon.dart';
import '../../texts/t-brand_title_with_icon.dart';
import 'favourite_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunction.isDarkMode(context);
    //print('Product image URL: ${product.thumbnail}');
    return GestureDetector(
      onTap: () => Get.to(()=>  ProductDetailsScreen(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark? TColors.darkGrey: TColors.white,
          boxShadow: [TShadowStyle.verticalProductShadow]

        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark? TColors.dark: TColors.light,
              child: Stack(
                children: [

                  ///product Image
                   TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true,),


                  /// sale tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('$salePercentage', style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.black),),
                    ),
                  ),
                   Positioned(
                    right: 0,
                      top: 0,
                      child: FavouriteIcon(productId: product.id,)),


                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItem / 2,
            ),
            /// Details
               Padding(padding: const EdgeInsets.only(left: TSizes.sm),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   TProductTitleText(title: product.title, smallSizes: true,),
                    const SizedBox(
                     height: TSizes.spaceBtwItem/2,
                   ),
                   TBrandTitleWithVerifyIcon(title: product.brand!.name,),



                 ],
               ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// actual price
                 Flexible(
                   child: Column(
                     children: [
                       if(product.productType == ProductType.single.toString() && product.salePrice>0)
                         Padding(
                           padding: const EdgeInsets.only(left: TSizes.sm),
                           child: Text(' ${product.price.toString()}', style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),),
                         ),
                       Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(price: controller.getProductPrice(product)),
                                       ),
                     ],
                   ),
                 ),
                ProductCardAddToCartButton(product: product,)
              ],
            )

          ],
        ),
      ),
    );
  }
}








