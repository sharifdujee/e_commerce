import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/features/shop/model/category_model.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/images/t_rounded_image.dart';
import '../../../../common/widget/product-cart/widget/product_card_horizontal.dart';
import '../../../../common/widget/texts/section_heading.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/helpers/shimmer/horizontal_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner4,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Subcategories
              FutureBuilder<List<CategoryModel>>(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  const loader = HorizontalProductShimmer();

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return loader;
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No subcategories found.'));
                  }

                  final subCategories = snapshot.data!;
                  //print('UI received subcategories: $subCategories');

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];
                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return loader;
                          }

                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }

                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text('No products found.'));
                          }

                          final products = snapshot.data!;
                          //print('UI received products for ${subCategory.name}: $products');

                          return Column(
                            children: [
                              /// Heading
                              TSectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(() => AllProducts(
                                  title: subCategory.name,
                                  futureMethod: controller.getCategoryProducts(
                                      categoryId: subCategory.id,
                                      limit: -1),
                                )),
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItem / 2,
                              ),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  separatorBuilder: (_, index) => const SizedBox(
                                    width: TSizes.spaceBtwItem,
                                  ),
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final product = products[index];
                                    //print('Displaying product for ${subCategory.name}: ${product.title}');
                                    return TProductCardHorizontal(product: product);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
