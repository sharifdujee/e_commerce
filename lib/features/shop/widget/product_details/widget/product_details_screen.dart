import 'package:e_commerce_app/common/widget/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_attribute.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_details_image_slider.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/product_review/product_reviews.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/rating_and_share.dart';
import 'package:e_commerce_app/features/shop/widget/product_details/widget/tbottom_addto_cart.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// image slider
            ProductImageSlider(
              product: product,
            ),

            ///product details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating and share
                  const TRatingAndShare(),

                  /// price , title, stock, brand
                  ProductMetaData(
                    product: product,
                  ),

                  /// attributes
                  //if(product.productType ==ProductType.variable.name)
                  ProductAttribute(
                    product: product,
                  ),
                  if (product.productType == ProductType.variable.name)
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                  /// checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),

                  /// Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  ReadMoreText(
                    product.description ?? '',
                    trimCollapsedText: 'Show More',
                    trimExpandedText: 'Less',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),

                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItem,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Review (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right5)),
                    ],
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
