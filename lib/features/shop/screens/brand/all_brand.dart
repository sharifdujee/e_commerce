import 'package:e_commerce_app/common/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/brands/brand_card.dart';
import 'package:e_commerce_app/common/widget/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/brand_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const TSectionHeading(title: 'Brands', showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItem,
            ),

            ///Brands
          Obx((){
            if(brandController.isLoading.value) {
              return const BrandShimmerEffect();
            }
            if(brandController.allBrand.isEmpty){
              return Center(
                child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
              );
            }
            return TGridLayout(
                itemCount: brandController.allBrand.length,
                mainAxisExtent: 80,
                itemBuilder: (_, index) {
                  final brand = brandController.allBrand[index];
                  return TBrandCard(
                    showBorder: true,
                    brand: brand,
                    onTap: ()=> Get.to(( BrandProducts(brand: brand,))),
                  );
                });
          }

          ),
          ]
        )),
      ),
    );
  }
}
