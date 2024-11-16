import 'package:e_commerce_app/common/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/appbar/tabbar.dart';
import 'package:e_commerce_app/common/widget/custom_shape/containers/search_container.dart';
import 'package:e_commerce_app/common/widget/product-cart/widget/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widget/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/features/shop/screens/brand/all_brand.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_app/features/shop/store/widgets/category_tab.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/brand_shimmer.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widget/brands/brand_card.dart';
import '../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featureCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CartCounter(

            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(
                            height: TSizes.spaceBtwItem,
                          ),
                          const SearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),

                          /// Feature Brand
                          TSectionHeading(
                            title: 'Feature Brands',
                            onPressed: ()=>Get.to(()=>const AllBrandScreen()),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItem / 1.5,
                          ),
                          Obx((){
                            if(brandController.isLoading.value) {
                              return const BrandShimmerEffect();
                            }
                            if(brandController.featuredBrand.isEmpty){
                              return Center(
                                child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                              );
                            }
                            return TGridLayout(
                                itemCount: brandController.featuredBrand.length,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand = brandController.featuredBrand[index];
                                  return TBrandCard(
                                    showBorder: true,
                                    onTap: ()=>Get.to((BrandProducts(brand: brand))), brand: brand,
                                  );
                                });
                          }
                          ),
                        ],
                      ),
                    ),

                    /// Tab
                    bottom:  TTabBar(tabs:
                      categories.map((category)=>Tab(child: Text(category.name))).toList()

                    ))
              ];
            },
            body:  TabBarView(children: categories.map((category)=>CategoryTab(category: category)).toList()
      ),
    )));
  }
}


