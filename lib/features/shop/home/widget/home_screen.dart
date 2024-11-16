import 'package:e_commerce_app/common/layout/grid_layout.dart';
import 'package:e_commerce_app/features/shop/home/widget/promo_slider.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/vertical_product_shimmer.dart';

import 'package:flutter/material.dart';
import '../../../../common/widget/custom_shape/containers/search_container.dart';
import '../../../../common/widget/custom_shape/curved_edge/primaryheader_container.dart';
import '../../../../common/widget/product-cart/widget/product_card_vertical.dart';
import '../../../../common/widget/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controller/product_controller.dart';
import 'home_app_bar.dart';
import 'home_category.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    //print('The product is ${controller.featuresProducts}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// appbar
                  const THomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// custom search bar
                  const SearchContainer(
                    text: 'Search in store ',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular categories',
                          showActionButton: false,
                          textColor: Colors.white,
                          onPressed: () => Get.to(()=> AllProducts(title: 'Popular Products',
                            //query:FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6),
                            futureMethod: controller.fetchAllFeatureProducts(),
                          ),

                          ),

                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItem,
                        ),

                        ///
                        const THomeCategories()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            /// body

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: ()  => Get.to(()=> const AllProducts(title: 'Popular Products',)),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItem,
                  ),
                  Obx(
                      (){
                        if(controller.isLoading.value) return const TVerticalCardShimmer();
                        if(controller.featuresProducts.isEmpty) {
                          return const Center(

                          child: Text('No Data Found'),
                        );
                        }
                       else{
                          return TGridLayout(
                              itemCount: controller.featuresProducts.length,
                              itemBuilder: (_, index) =>  TProductCardVertical(product: controller.featuresProducts[index],));
                        }
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     // bottomNavigationBar: const NavigationMenu(),
    );
  }
}
