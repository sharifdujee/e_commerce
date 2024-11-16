import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/brands/brand_card.dart';
import 'package:e_commerce_app/common/widget/product-cart/sortable/sortable_products.dart';
import 'package:e_commerce_app/features/personalization/model/product/brandModel.dart';
import 'package:e_commerce_app/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  const   loader = TVerticalCardShimmer();
                  final widget = TCloudHelperFunction.checkMultiRecord(snapShot: snapshot, loader: loader);
                  if(widget !=null) return widget;

                  final brandProducts = snapshot.data!;


                  return  TSortableProduct(
                    products: brandProducts,
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
