import 'package:e_commerce_app/common/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/features/shop/model/category_model.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/store/widgets/category_brand.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widget/product-cart/widget/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/shimmer/vertical_product_shimmer.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrand(category: category),
              const SizedBox(
                height: TSizes.spaceBtwItem,
              ),

              /// Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  final response = TCloudHelperFunction.checkMultiRecord(
                    snapShot: snapshot, // Corrected to "snapshot"
                    loader: const TVerticalCardShimmer(),
                  );

                  if (response != null) return response;

                  final products = snapshot.data!;
                  return Column(
                    children: [
                      TSectionHeading(
                        title: 'You Might Like',
                        onPressed: () => Get.to(AllProducts(
                          title: category.name,
                          futureMethod: controller.getCategoryProducts(
                              categoryId: category.id, limit: -1),
                        )),
                      ),
                      TGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                          product: products[index],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwItem,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
